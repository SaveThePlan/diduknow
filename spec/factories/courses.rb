FactoryGirl.define do

  factory :course, class: Course do
    sequence(:title) {|n| "Course #{n}"}
    user

    factory :course_with_chapters do
      transient do
        chapters_count 2
      end

      after(:create) do |obj, evaluator|
        create_list(:chapter, evaluator.chapters_count, course: obj)
      end
    end

  end

end
