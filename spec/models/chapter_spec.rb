require 'rails_helper'

RSpec.describe Chapter, type: :model do

  let(:b_chapter) { build :chapter }

  context 'included modules' do
    describe 'PermitsAttributes' do
      it { expect(subject).to be_kind_of PermitsAttributes }
    end
  end


  context 'validations' do
    describe 'presence of title' do
      it { expect(b_chapter).to be_valid }
      it { expect(build :chapter, title: nil).to_not be_valid }
    end

    describe 'presence of course' do
      it { expect(b_chapter).to be_valid }
      it { expect(build :chapter, course: nil).to_not be_valid }
    end
  end


  context 'relations' do
    describe '.course (belongs to)' do
      subject { b_chapter }
      it { expect(subject).to respond_to(:course) }
      it { expect(subject.course).to be_a Course }
    end
  end


  context 'attributes' do
    let(:title) { "My title" }

    subject { build :chapter, title: title }

    describe '.title' do
      it { should respond_to(:title) }
      it { expect(subject.title).to be_a String }
      it { expect(subject.title).to eq title }
    end
  end

end
