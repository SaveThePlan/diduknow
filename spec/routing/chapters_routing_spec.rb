require "rails_helper"

RSpec.describe ChaptersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/courses/11/chapters").to route_to("chapters#index", course_id: "11")
    end

    it "routes to #new" do
      expect(:get => "/courses/11/chapters/new").to route_to("chapters#new", course_id: "11")
    end

    it "routes to #show" do
      expect(:get => "/chapters/1").to route_to("chapters#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/chapters/1/edit").to route_to("chapters#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/courses/11/chapters").to route_to("chapters#create", course_id: "11")
    end

    it "routes to #update via PUT" do
      expect(:put => "/chapters/1").to route_to("chapters#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/chapters/1").to route_to("chapters#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/chapters/1").to route_to("chapters#destroy", :id => "1")
    end

  end
end
