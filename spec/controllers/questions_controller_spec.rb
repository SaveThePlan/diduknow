require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do

  let(:valid_attributes) {
    attributes_for :question
  }

  let(:invalid_attributes) {
    attributes_for :question, statement: nil
  }

  let(:valid_session) { {} }

  let(:user) { create :user }

  before do
    user_signed_in user
  end

  describe "GET #index" do
    it "assigns all questions as @questions" do
      question = create :question
      get :index, {}, valid_session
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
      get :new, {}, valid_session
      expect(assigns(:question)).to be_a_new(Question)
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
          post :create, {:question => valid_attributes}, valid_session
        }.to change(Question, :count).by(1)
      end

      it "assigns a newly created question as @question" do
        post :create, {:question => valid_attributes}, valid_session
        expect(assigns(:question)).to be_a(Question)
        expect(assigns(:question)).to be_persisted
      end

      it "redirects to the created question" do
        post :create, {:question => valid_attributes}, valid_session
        expect(response).to redirect_to(Question.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved question as @question" do
        post :create, {:question => invalid_attributes}, valid_session
        expect(assigns(:question)).to be_a_new(Question)
      end

      it "re-renders the 'new' template" do
        post :create, {:question => invalid_attributes}, valid_session
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
      question = create :question
      expect {
        delete :destroy, {:id => question.to_param}, valid_session
      }.to change(Question, :count).by(-1)
    end

    it "redirects to the questions list" do
      question = create :question
      delete :destroy, {:id => question.to_param}, valid_session
      expect(response).to redirect_to(questions_url)
    end
  end

end
