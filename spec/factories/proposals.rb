FactoryGirl.define do

  factory :proposal, class: Proposal do
    sequence(:statement) {|n| "I am a proposal #{n} ?"}
  end

end
