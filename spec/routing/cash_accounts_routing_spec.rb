require "rails_helper"

RSpec.describe CashAccountsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/cash_accounts").to route_to("cash_accounts#index")
    end

    it "routes to #show" do
      expect(:get => "/cash_accounts/1").to route_to("cash_accounts#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/cash_accounts").to route_to("cash_accounts#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/cash_accounts/1").to route_to("cash_accounts#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/cash_accounts/1").to route_to("cash_accounts#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/cash_accounts/1").to route_to("cash_accounts#destroy", :id => "1")
    end
  end
end
