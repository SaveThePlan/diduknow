require 'rails_helper'

RSpec.describe "Courses", type: :request do

  before do
    login_user
  end

  after do
    after_each_test
  end

  describe "GET /courses" do
    it "works! (now write some real specs)" do
      get courses_path
      expect(response).to have_http_status(200)
    end
  end
end
