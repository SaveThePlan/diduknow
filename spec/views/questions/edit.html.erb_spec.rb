require 'rails_helper'

RSpec.describe "questions/edit", type: :view do
  before(:each) do
    @question = assign(:question, create(:question))
  end

  it "renders" do
    render
  end
end
