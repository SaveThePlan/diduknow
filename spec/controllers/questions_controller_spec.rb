require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do

  let(:answer_attributes) {
    attributes_for :proposal
  }

  let(:valid_attributes) {
    attributes_for :question, answer_attributes: answer_attributes
  }

  let(:invalid_attributes) {
    attributes_for :question, statement: nil
  }

  let(:valid_session) { {} }

  let(:user) { create :user }
  let!(:lesson) { create :lesson }

  before do
    user_signed_in user
  end

  describe "GET #index" do
    it "assigns lesson as @lesson" do
      get :index, {lesson_id: lesson.to_param}, valid_session
      expect(assigns(:lesson)).to eq(lesson)
    end

    it "assigns all questions as @questions" do
      question = create :question, lesson: lesson
      fake_question = create :question
      get :index, {lesson_id: lesson.to_param}, valid_session
      expect(assigns(:questions)).to eq([question])
    end
  end

  describe "GET #play" do
    it "assigns lesson as @lesson" do
      get :play, {lesson_id: lesson.to_param}, valid_session
      expect(assigns(:lesson)).to eq(lesson)
    end

    it "assigns all questions as @questions" do
      question = create :question, lesson: lesson
      fake_question = create :question
      get :play, {lesson_id: lesson.to_param}, valid_session
      expect(assigns(:questions)).to eq([question])
    end
  end

  describe "GET #show" do
    it "assigns the requested question as @question" do
      question = create :question
      get :show, {:id => question.to_param}, valid_session
      expect(assigns(:question)).to eq(question)
    end
  end

  describe "GET #new" do
    it "assigns a new question as @question" do
      get :new, {lesson_id: lesson.to_param}, valid_session
      expect(assigns(:question)).to be_a_new(Question)
      expect(assigns(:question).lesson).to eq lesson
    end
  end

  describe "GET #edit" do
    it "assigns the requested question as @question" do
      question = create :question
      get :edit, {:id => question.to_param}, valid_session
      expect(assigns(:question)).to eq(question)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Question" do
        expect {
          post :create, {lesson_id: lesson.to_param, :question => valid_attributes}, valid_session
        }.to change(Question, :count).by(1)
      end

      it "assigns a newly created question as @question" do
        post :create, {lesson_id: lesson.to_param, :question => valid_attributes}, valid_session
        expect(assigns(:question)).to be_a(Question)
        expect(assigns(:question)).to be_persisted
      end

      it "redirects to the created question" do
        post :create, {lesson_id: lesson.to_param, :question => valid_attributes}, valid_session
        expect(response).to redirect_to(Question.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved question as @question" do
        post :create, {lesson_id: lesson.to_param, :question => invalid_attributes}, valid_session
        expect(assigns(:question)).to be_a_new(Question)
      end

      it "re-renders the 'new' template" do
        post :create, {lesson_id: lesson.to_param, :question => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {statement: 'New statement'}
      }

      it "updates the requested question" do
        question = create :question
        put :update, {:id => question.to_param, :question => new_attributes}, valid_session
        question.reload
        expect(question.statement).to eq new_attributes[:statement]
      end

      it "assigns the requested question as @question" do
        question = create :question
        put :update, {:id => question.to_param, :question => valid_attributes}, valid_session
        expect(assigns(:question)).to eq(question)
      end

      it "redirects to the question" do
        question = create :question
        put :update, {:id => question.to_param, :question => valid_attributes}, valid_session
        expect(response).to redirect_to(question)
      end
    end

    context "with invalid params" do
      it "assigns the question as @question" do
        question = create :question
        put :update, {:id => question.to_param, :question => invalid_attributes}, valid_session
        expect(assigns(:question)).to eq(question)
      end

      it "re-renders the 'edit' template" do
        question = create :question
        put :update, {:id => question.to_param, :question => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested question" do
      question = create :question, lesson: lesson
      expect {
        delete :destroy, {:id => question.to_param}, valid_session
      }.to change(Question, :count).by(-1)
    end

    it "redirects to the questions list" do
      question = create :question, lesson: lesson
      delete :destroy, {:id => question.to_param}, valid_session
      expect(response).to redirect_to(lesson)
    end
  end

end
