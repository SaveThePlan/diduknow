FactoryGirl.define do

  factory :question, class: Question do
    sequence(:statement) {|n| "Can you answer this question #{n} ?"}
  end

end
