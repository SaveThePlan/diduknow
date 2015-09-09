FactoryGirl.define do

  factory :chapter, class: Chapter do
    sequence(:title) { |n| "Chapter #{n}" }
    course
  end

end
