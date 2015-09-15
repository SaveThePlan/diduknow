require 'rails_helper'

RSpec.describe LessonsController, type: :controller do

  let(:valid_attributes) {
    attributes_for :lesson
  }

  let(:invalid_attributes) {
    attributes_for :lesson, title: nil
  }

  let(:valid_session) { {} }

  let(:user) { create :user }

  before do
    user_signed_in user
  end

  describe "GET #index" do
    it "assigns all lessons as @lessons" do
      lesson = create :lesson
      get :index, {}, valid_session
      expect(assigns(:lessons)).to eq([lesson])
    end
  end

  describe "GET #show" do
    it "assigns the requested lesson as @lesson" do
      lesson = create :lesson
      get :show, {:id => lesson.to_param}, valid_session
      expect(assigns(:lesson)).to eq(lesson)
    end
  end

  describe "GET #new" do
    it "assigns a new lesson as @lesson" do
      get :new, {}, valid_session
      expect(assigns(:lesson)).to be_a_new(Lesson)
    end
  end

  describe "GET #edit" do
    it "assigns the requested lesson as @lesson" do
      lesson = create :lesson
      get :edit, {:id => lesson.to_param}, valid_session
      expect(assigns(:lesson)).to eq(lesson)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Lesson" do
        expect {
          post :create, {:lesson => valid_attributes}, valid_session
        }.to change(Lesson, :count).by(1)
      end

      it "assigns a newly created lesson as @lesson" do
        post :create, {:lesson => valid_attributes}, valid_session
        expect(assigns(:lesson)).to be_a(Lesson)
        expect(assigns(:lesson)).to be_persisted
      end

      it "redirects to the created lesson" do
        post :create, {:lesson => valid_attributes}, valid_session
        expect(response).to redirect_to(Lesson.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved lesson as @lesson" do
        post :create, {:lesson => invalid_attributes}, valid_session
        expect(assigns(:lesson)).to be_a_new(Lesson)
      end

      it "re-renders the 'new' template" do
        post :create, {:lesson => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {title: 'new title'}
      }

      it "updates the requested lesson" do
        lesson = create :lesson
        put :update, {:id => lesson.to_param, :lesson => new_attributes}, valid_session
        lesson.reload
        expect(lesson.title).to eq new_attributes[:title]
      end

      it "assigns the requested lesson as @lesson" do
        lesson = create :lesson
        put :update, {:id => lesson.to_param, :lesson => valid_attributes}, valid_session
        expect(assigns(:lesson)).to eq(lesson)
      end

      it "redirects to the lesson" do
        lesson = create :lesson
        put :update, {:id => lesson.to_param, :lesson => valid_attributes}, valid_session
        expect(response).to redirect_to(lesson)
      end
    end

    context "with invalid params" do
      it "assigns the lesson as @lesson" do
        lesson = create :lesson
        put :update, {:id => lesson.to_param, :lesson => invalid_attributes}, valid_session
        expect(assigns(:lesson)).to eq(lesson)
      end

      it "re-renders the 'edit' template" do
        lesson = create :lesson
        put :update, {:id => lesson.to_param, :lesson => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested lesson" do
      lesson = create :lesson
      expect {
        delete :destroy, {:id => lesson.to_param}, valid_session
      }.to change(Lesson, :count).by(-1)
    end

    it "redirects to the lessons list" do
      lesson = create :lesson
      delete :destroy, {:id => lesson.to_param}, valid_session
      expect(response).to redirect_to(lessons_url)
    end
  end

end
