require 'rails_helper'

RSpec.describe "questions/new", type: :view do
  before(:each) do
    assign(:lesson, create(:lesson))
    assign(:question, Question.new)
  end

  it "renders" do
    render
  end
end
