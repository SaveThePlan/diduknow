require 'rails_helper'

RSpec.describe "lessons/index", type: :view do
  before(:each) do
    assign(:lessons, create_list(:lesson, 2))
  end

  it "renders" do
    render
  end
end
