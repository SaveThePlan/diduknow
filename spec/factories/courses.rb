FactoryGirl.define do

  factory :course, class: Course do
    sequence(:title) {|n| "Course #{n}"}
    user
  end

end
