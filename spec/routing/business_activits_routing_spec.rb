require "spec_helper"

describe BusinessActivitsController do
  describe "routing" do

    it "routes to #index" do
      get("/business_activits").should route_to("business_activits#index")
    end

    it "routes to #new" do
      get("/business_activits/new").should route_to("business_activits#new")
    end

    it "routes to #show" do
      get("/business_activits/1").should route_to("business_activits#show", :id => "1")
    end

    it "routes to #edit" do
      get("/business_activits/1/edit").should route_to("business_activits#edit", :id => "1")
    end

    it "routes to #create" do
      post("/business_activits").should route_to("business_activits#create")
    end

    it "routes to #update" do
      put("/business_activits/1").should route_to("business_activits#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/business_activits/1").should route_to("business_activits#destroy", :id => "1")
    end

  end
end
