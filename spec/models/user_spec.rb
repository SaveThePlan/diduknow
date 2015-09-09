require 'rails_helper'

RSpec.describe User, type: :model do

  let(:b_user) { build :user }

  context 'included modules' do
    describe 'PermitsAttributes' do
      it { expect(subject).to be_kind_of PermitsAttributes }
    end
  end


  context 'validations' do
    describe 'presence of email' do
      it { expect(b_user).to be_valid }
      it { expect(build :user, email: nil).to_not be_valid }
    end
  end


  context 'relations' do
    describe '.courses (has_many)' do
      subject { create :user_with_courses, courses_count: 2 }
      it { expect(subject).to respond_to(:courses) }
      it { expect(subject.courses.length).to eq 2 }
      it { expect(subject.courses.first).to be_a Course }
    end

    describe 'roles' do
      subject { create :user }

      describe '.add_role' do
        it { should respond_to(:add_role) }
      end

      describe '.has_role?' do
        before { subject.add_role :admin }
        it { should respond_to(:has_role?) }
        it { expect(subject.has_role? :admin).to be true }
        it { expect(subject.has_role? :wrong).to be false }
      end
    end
  end


  context 'attributes' do
    let(:email) { 'my.email@example.com' }

    subject { build :user, email: email }

    describe '.email' do
      it { should respond_to(:email) }
      it { expect(subject.email).to be_a String }
      it { expect(subject.email).to eq email }
    end
  end

end
