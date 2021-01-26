require "rails_helper"

RSpec.describe OutgoingsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/outgoings").to route_to("outgoings#index")
    end

    it "routes to #show" do
      expect(:get => "/outgoings/1").to route_to("outgoings#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/outgoings").to route_to("outgoings#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/outgoings/1").to route_to("outgoings#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/outgoings/1").to route_to("outgoings#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/outgoings/1").to route_to("outgoings#destroy", :id => "1")
    end
  end
end
