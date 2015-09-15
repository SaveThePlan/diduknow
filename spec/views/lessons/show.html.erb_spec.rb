require 'rails_helper'

RSpec.describe "lessons/show", type: :view do
  before(:each) do
    @lesson = assign(:lesson, create(:lesson))
  end

  it "renders" do
    render
  end
end
