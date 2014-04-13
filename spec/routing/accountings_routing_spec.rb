require "spec_helper"

describe AccountingsController do
  describe "routing" do

    it "routes to #index" do
      get("/accountings").should route_to("accountings#index")
    end

    it "routes to #new" do
      get("/accountings/new").should route_to("accountings#new")
    end

    it "routes to #show" do
      get("/accountings/1").should route_to("accountings#show", :id => "1")
    end

    it "routes to #edit" do
      get("/accountings/1/edit").should route_to("accountings#edit", :id => "1")
    end

    it "routes to #create" do
      post("/accountings").should route_to("accountings#create")
    end

    it "routes to #update" do
      put("/accountings/1").should route_to("accountings#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/accountings/1").should route_to("accountings#destroy", :id => "1")
    end

  end
end
