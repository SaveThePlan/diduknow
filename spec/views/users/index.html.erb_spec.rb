require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, create_list(:user, 2))
  end

  it "renders" do
    render
  end
end
