require 'benchmark_helper'
require 'rails/performance_test_help'

class WorkerCreationTest < ActionDispatch::PerformanceTest
  setup do
    DatabaseCleaner.start
    @skills = []
    10.times {|i| @skills << Skill.create(keyword: "#{Faker::Company.profession} #{i}")}
  end

  test 'create worker with 10 skills' do
    post '/workers', {:worker => {name: Faker::Internet.name, email: Faker::Internet.email, skills: @skills.map(&:keyword)}}
  end

  teardown do
    DatabaseCleaner.clean
  end
end