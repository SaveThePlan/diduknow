require 'rails_helper'

RSpec.describe "lessons/new", type: :view do
  before(:each) do
    assign(:chapter, create(:chapter))
    assign(:lesson, Lesson.new)
  end

  it "renders" do
    render
  end
end
