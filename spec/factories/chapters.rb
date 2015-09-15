FactoryGirl.define do

  factory :chapter, class: Chapter do
    sequence(:title) { |n| "Chapter #{n}" }
    course

    factory :chapter_with_lessons do
      transient do
        lessons_count 2
      end

      after(:create) do |obj, evaluator|
        create_list(:lesson, evaluator.lessons_count, chapter: obj)
      end
    end

  end

end
