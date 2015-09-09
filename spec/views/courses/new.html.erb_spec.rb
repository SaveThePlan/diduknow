require 'rails_helper'

RSpec.describe "courses/new", type: :view do
  before(:each) do
    assign(:course, Course.new)
  end

  it "renders" do
    render
  end
end
