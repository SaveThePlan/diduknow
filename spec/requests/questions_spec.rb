require 'rails_helper'

RSpec.describe "Questions", type: :request do

  before do
    login_user
  end

  after do
    after_each_test
  end

  describe "GET /questions" do
    it "works! (now write some real specs)" do
      lesson = create :lesson
      get lesson_questions_path(lesson)
      expect(response).to have_http_status(200)
    end
  end
end
