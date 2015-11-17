FactoryGirl.define do
  factory :skill do
    keyword { Faker::Company.profession }
  end

  factory :user do
    email { Faker::Internet.email }
    name  { Faker::Name.name }

    factory :worker, class: Worker do
      after(:create) do |worker, evaluator|
        worker.skills += create_list(:skill, 3)
      end
    end

    factory :customer do

    end
  end
end