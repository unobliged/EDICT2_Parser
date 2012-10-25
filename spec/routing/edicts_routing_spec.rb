require "spec_helper"

describe EdictsController do
  describe "routing" do

    it "routes to #index" do
      get("/edicts").should route_to("edicts#index")
    end

    it "routes to #new" do
      get("/edicts/new").should route_to("edicts#new")
    end

    it "routes to #show" do
      get("/edicts/1").should route_to("edicts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/edicts/1/edit").should route_to("edicts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/edicts").should route_to("edicts#create")
    end

    it "routes to #update" do
      put("/edicts/1").should route_to("edicts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/edicts/1").should route_to("edicts#destroy", :id => "1")
    end

  end
end
