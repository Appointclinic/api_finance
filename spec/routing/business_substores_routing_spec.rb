require "rails_helper"

RSpec.describe BusinessSubstoresController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/business_substores").to route_to("business_substores#index")
    end

    it "routes to #show" do
      expect(:get => "/business_substores/1").to route_to("business_substores#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/business_substores").to route_to("business_substores#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/business_substores/1").to route_to("business_substores#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/business_substores/1").to route_to("business_substores#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/business_substores/1").to route_to("business_substores#destroy", :id => "1")
    end
  end
end
