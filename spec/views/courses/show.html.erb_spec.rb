require 'rails_helper'

RSpec.describe "courses/show", type: :view do
  before(:each) do
    @course = assign(:course, create(:course))
  end

  it "renders" do
    render
  end
end
