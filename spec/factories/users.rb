FactoryGirl.define do

  factory :user, class: User do
    sequence(:email) { |n| "johndoe#{n}@example.com" }

    after(:build) do |user, evaluator|
      user.password = user.password_confirmation = 'motdepasse'
    end

    factory :user_with_courses do
      transient do
        courses_count 2
      end

      after(:create) do |obj, evaluator|
        create_list(:course, evaluator.courses_count, user: obj)
      end
    end

  end

end
