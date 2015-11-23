require 'benchmark_helper'
require 'rails/performance_test_help'

class SearchTest < ActionDispatch::PerformanceTest
  setup do
    number_of_skills = 10
    number_of_workers = 100
    number_of_skills_to_match = 3

    DatabaseCleaner.clean

    # using transaction here could speed up the benchmark setup, but would require more memory
    @skills = number_of_skills.times.collect {|i| Skill.create(keyword: "#{Faker::Company.profession} #{i}") }
    @workers = number_of_workers.times.collect {|i| Worker.create(email: "#{i}#{Faker::Internet.email}", name: "#{Faker::Name.name}")}
    @workers.each do |w|
      # assign random number of skills per worker
      skills_count = Random.rand(10)
      w.skills = @skills.sample(skills_count)
    end
    @skills_to_find = @skills.sample(number_of_skills_to_match).map(&:keyword)
  end

  test "search" do
    puts "Searching workers that have skills: #{@skills_to_find.join(',')}"

    get '/search', {search: {skills: @skills_to_find}}
  end

  teardown do
    # print the number of workers found
    puts "#{response.body.scan(/<h3>([^<>]*)<\/h3>/imu).flatten.first}"
  end
end
