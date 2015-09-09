require 'rails_helper'

RSpec.describe "chapters/index", type: :view do
  before(:each) do
    assign(:course, create(:course))
    assign(:chapters, create_list(:chapter, 2))
  end

  it "renders" do
    render
  end
end
