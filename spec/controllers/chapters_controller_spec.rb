require 'rails_helper'

RSpec.describe ChaptersController, type: :controller do

  let(:valid_attributes) {
    attributes_for :chapter
  }

  let(:invalid_attributes) {
    attributes_for :chapter, title: nil
  }

  let(:valid_session) { {} }

  let(:user) {create :user}

  before do
    user_signed_in user
  end

  describe "GET #index" do
    it "assigns all chapters as @chapters" do
      chapter = create :chapter
      get :index, {}, valid_session
      expect(assigns(:chapters)).to eq([chapter])
    end
  end

  describe "GET #show" do
    it "assigns the requested chapter as @chapter" do
      chapter = create :chapter
      get :show, {:id => chapter.to_param}, valid_session
      expect(assigns(:chapter)).to eq(chapter)
    end
  end

  describe "GET #new" do
    it "assigns a new chapter as @chapter" do
      get :new, {}, valid_session
      expect(assigns(:chapter)).to be_a_new(Chapter)
    end
  end

  describe "GET #edit" do
    it "assigns the requested chapter as @chapter" do
      chapter = create :chapter
      get :edit, {:id => chapter.to_param}, valid_session
      expect(assigns(:chapter)).to eq(chapter)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Chapter" do
        expect {
          post :create, {:chapter => valid_attributes}, valid_session
        }.to change(Chapter, :count).by(1)
      end

      it "assigns a newly created chapter as @chapter" do
        post :create, {:chapter => valid_attributes}, valid_session
        expect(assigns(:chapter)).to be_a(Chapter)
        expect(assigns(:chapter)).to be_persisted
      end

      it "redirects to the created chapter" do
        post :create, {:chapter => valid_attributes}, valid_session
        expect(response).to redirect_to(Chapter.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved chapter as @chapter" do
        post :create, {:chapter => invalid_attributes}, valid_session
        expect(assigns(:chapter)).to be_a_new(Chapter)
      end

      it "re-renders the 'new' template" do
        post :create, {:chapter => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {title: "New title"}
      }

      it "updates the requested chapter" do
        chapter = create :chapter
        put :update, {:id => chapter.to_param, :chapter => new_attributes}, valid_session
        chapter.reload
        expect(chapter.title).to eq new_attributes[:title]
      end

      it "assigns the requested chapter as @chapter" do
        chapter = create :chapter
        put :update, {:id => chapter.to_param, :chapter => valid_attributes}, valid_session
        expect(assigns(:chapter)).to eq(chapter)
      end

      it "redirects to the chapter" do
        chapter = create :chapter
        put :update, {:id => chapter.to_param, :chapter => valid_attributes}, valid_session
        expect(response).to redirect_to(chapter)
      end
    end

    context "with invalid params" do
      it "assigns the chapter as @chapter" do
        chapter = create :chapter
        put :update, {:id => chapter.to_param, :chapter => invalid_attributes}, valid_session
        expect(assigns(:chapter)).to eq(chapter)
      end

      it "re-renders the 'edit' template" do
        chapter = create :chapter
        put :update, {:id => chapter.to_param, :chapter => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested chapter" do
      chapter = create :chapter
      expect {
        delete :destroy, {:id => chapter.to_param}, valid_session
      }.to change(Chapter, :count).by(-1)
    end

    it "redirects to the chapters list" do
      chapter = create :chapter
      delete :destroy, {:id => chapter.to_param}, valid_session
      expect(response).to redirect_to(chapters_url)
    end
  end

end
