require "rails_helper"

RSpec.describe IncomingsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/incomings").to route_to("incomings#index")
    end

    it "routes to #show" do
      expect(:get => "/incomings/1").to route_to("incomings#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/incomings").to route_to("incomings#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/incomings/1").to route_to("incomings#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/incomings/1").to route_to("incomings#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/incomings/1").to route_to("incomings#destroy", :id => "1")
    end
  end
end
