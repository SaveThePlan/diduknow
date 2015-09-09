require 'rails_helper'

RSpec.describe "chapters/show", type: :view do
  before(:each) do
    @chapter = assign(:chapter, create(:chapter))
  end

  it "renders" do
    render
  end
end
