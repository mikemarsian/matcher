FactoryGirl.define do
  sequence(:skill) {|n| "#{Faker::Company.profession} #{n}"}
  sequence(:email) {|n| "#{n}#{Faker::Internet.email}"}

  factory :skill do
    keyword { generate(:skill) }
  end

  factory :user do
    email { generate(:email) }
    name  { Faker::Name.name }

    factory :worker, class: Worker do

      factory :worker_with_skills, class: Worker do
        after(:create) do |worker, evaluator|
          worker.skills = create_list(:skill, 3)
        end
      end
    end

    factory :customer do

    end
  end
end