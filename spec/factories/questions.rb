FactoryGirl.define do

  factory :question, class: Question do
    sequence(:statement) {|n| "Can you answer this question #{n} ?"}
    lesson

    after(:build) do |obj, evaluator|
      obj.answer = build(:proposal, question: obj)
    end
  end

  factory :question_no_answer, class: Question do
    sequence(:statement) {|n| "Can you answer this question #{n} ?"}
    lesson
  end

end
