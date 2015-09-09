FactoryGirl.define do

  factory :user, class: User do
    sequence(:email) { |n| "johndoe#{n}@example.com" }

    after(:build) do |user, evaluator|
      user.password = user.password_confirmation = 'motdepasse'
    end
  end

end
