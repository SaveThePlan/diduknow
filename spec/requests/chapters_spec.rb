require 'rails_helper'

RSpec.describe "Chapters", type: :request do

  before do
    login_user
  end

  after do
    after_each_test
  end

  describe "GET /chapters" do
    it "works! (now write some real specs)" do
      get chapters_path
      expect(response).to have_http_status(200)
    end
  end
end
