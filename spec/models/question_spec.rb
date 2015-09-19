require 'rails_helper'

RSpec.describe Question, type: :model do

  let(:b_question) { build :question }

  context 'included modules' do
    describe 'PermitsAttributes' do
      it { expect(subject).to be_kind_of PermitsAttributes }
    end
  end


  context 'validations' do
    describe 'presence of statement' do
      it { expect(b_question).to be_valid }
      it { expect(build :question, statement: nil).to_not be_valid }
    end

    describe 'presence of lesson' do
      it { expect(b_question).to be_valid }
      it { expect(build :question, lesson: nil).to_not be_valid }
    end

    describe 'presence of answer' do
      it { expect(b_question).to be_valid }
      it { expect(build :question_no_answer).to_not be_valid }
    end
  end


  context 'relations' do
    describe '.lesson (belongs to)' do
      subject { b_question }
      it { expect(subject).to respond_to(:lesson) }
      it { expect(subject.lesson).to be_a Lesson }
    end

    describe '.answer (has_one)' do
      subject { b_question }
      it { expect(subject).to respond_to(:answer) }
      it { expect(subject.answer).to be_a Proposal }
    end
  end


  context 'attributes' do
    let(:statement) { "My statement" }

    subject { build :question, statement: statement }

    describe '.statement' do
      it { should respond_to(:statement) }
      it { expect(subject.statement).to be_a String }
      it { expect(subject.statement).to eq statement }
    end
  end

end
