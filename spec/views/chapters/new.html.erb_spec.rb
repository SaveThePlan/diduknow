require 'rails_helper'

RSpec.describe "chapters/new", type: :view do
  before(:each) do
    assign(:chapter, Chapter.new)
  end

  it "renders" do
    render
  end
end
