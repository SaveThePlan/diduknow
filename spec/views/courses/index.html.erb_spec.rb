require 'rails_helper'

RSpec.describe "courses/index", type: :view do
  before(:each) do
    assign(:courses, create_list(:course, 2))
  end

  it "renders" do
    render
  end
end
