require 'rails_helper'

RSpec.describe "questions/show", type: :view do
  before(:each) do
    @question = assign(:question, create(:question))
  end

  it "renders" do
    render
  end
end
