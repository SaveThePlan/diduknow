require 'rails_helper'

RSpec.describe Course, type: :model do

  let(:b_course) { build :course }

  context 'included modules' do
    describe 'PermitsAttributes' do
      it { expect(subject).to be_kind_of PermitsAttributes }
    end
  end


  context 'validations' do
    describe 'presence of title' do
      it { expect(b_course).to be_valid }
      it { expect(build :course, title: nil).to_not be_valid }
    end

    describe 'presence of user' do
      it { expect(b_course).to be_valid }
      it { expect(build :course, user: nil).to_not be_valid }
    end
  end


  context 'relations' do
    describe '.user (belongs to)' do
      subject { b_course }
      it { expect(subject).to respond_to(:user) }
      it { expect(subject.user).to be_a User }
    end
  end


  context 'attributes' do
    let(:title) { "My title" }

    subject { build :course, title: title }

    describe '.title' do
      it { should respond_to(:title) }
      it { expect(subject.title).to be_a String }
      it { expect(subject.title).to eq title }
    end
  end

end
