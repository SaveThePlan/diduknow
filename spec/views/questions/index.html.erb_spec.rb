require 'rails_helper'

RSpec.describe "questions/index", type: :view do
  before(:each) do
    assign(:lesson, create(:lesson))
    assign(:questions, create_list(:question, 2))
  end

  it "renders" do
    render
  end
end
