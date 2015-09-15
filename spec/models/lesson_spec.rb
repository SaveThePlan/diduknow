require 'rails_helper'

RSpec.describe Lesson, type: :model do

  let(:b_lesson) { build :lesson }

  context 'included modules' do
    describe 'PermitsAttributes' do
      it { expect(subject).to be_kind_of PermitsAttributes }
    end
  end


  context 'validations' do
    describe 'presence of title' do
      it { expect(b_lesson).to be_valid }
      it { expect(build :lesson, title: nil).to_not be_valid }
    end

    describe 'presence of chapter' do
      it { expect(b_lesson).to be_valid }
      it { expect(build :lesson, chapter: nil).to_not be_valid }
    end
  end


  context 'relations' do
    describe '.chapter (belongs to)' do
      subject { b_lesson }
      it { expect(subject).to respond_to(:chapter) }
      it { expect(subject.chapter).to be_a Chapter }
    end
  end


  context 'attributes' do
    let(:title) { "My title" }
    let(:content) { "My content" }

    subject { build :lesson, title: title, content: content }

    describe '.title' do
      it { should respond_to(:title) }
      it { expect(subject.title).to be_a String }
      it { expect(subject.title).to eq title }
    end

    describe '.content' do
      it { should respond_to(:content) }
      it { expect(subject.content).to be_a String }
      it { expect(subject.content).to eq content }
    end
  end

end
