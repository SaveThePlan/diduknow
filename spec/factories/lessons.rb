FactoryGirl.define do

  factory :lesson, class: Lesson do
    sequence(:title) { |n| "Lesson #{n}" }
    content "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute
irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat
cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    chapter

    factory :lesson_with_questions do
      transient do
        questions_count 2
      end

      after(:create) do |obj, evaluator|
        create_list(:question, evaluator.questions_count, lesson: obj)
      end
    end

  end

end
