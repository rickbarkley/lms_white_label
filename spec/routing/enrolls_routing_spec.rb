require "spec_helper"

describe EnrollsController do
  describe "routing" do

    it "routes to #index" do
      get("/enrolls").should route_to("enrolls#index")
    end

    it "routes to #new" do
      get("/enrolls/new").should route_to("enrolls#new")
    end

    it "routes to #show" do
      get("/enrolls/1").should route_to("enrolls#show", :id => "1")
    end

    it "routes to #edit" do
      get("/enrolls/1/edit").should route_to("enrolls#edit", :id => "1")
    end

    it "routes to #create" do
      post("/enrolls").should route_to("enrolls#create")
    end

    it "routes to #update" do
      put("/enrolls/1").should route_to("enrolls#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/enrolls/1").should route_to("enrolls#destroy", :id => "1")
    end

  end
end
