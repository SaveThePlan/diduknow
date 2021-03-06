require 'rails_helper'

RSpec.describe Proposal, type: :model do

  let(:b_proposal) { build :proposal }

  context 'included modules' do
    describe 'PermitsAttributes' do
      it { expect(subject).to be_kind_of PermitsAttributes }
    end
  end


  context 'validations' do
    describe 'presence of statement' do
      it { expect(b_proposal).to be_valid }
      it { expect(build :proposal, statement: nil).to_not be_valid }
    end

    describe 'presence of question' do
      it { expect(b_proposal).to be_valid }
      it { expect(build :proposal, question: nil).to_not be_valid }
    end
  end


  context 'relations' do
    describe '.question (belongs to)' do
      subject { b_proposal }
      it { expect(subject).to respond_to(:question) }
      it { expect(subject.question).to be_a Question }
    end
  end


  context 'attributes' do
    let(:statement) { "My statement" }

    subject { build :proposal, statement: statement }

    describe '.statement' do
      it { should respond_to(:statement) }
      it { expect(subject.statement).to be_a String }
      it { expect(subject.statement).to eq statement }
    end
  end

end
