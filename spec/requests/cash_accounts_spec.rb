require 'rails_helper'

RSpec.describe "CashAccounts", type: :request do
  describe "GET /cash_accounts" do
    it "works! (now write some real specs)" do
      get cash_accounts_path
      expect(response).to have_http_status(200)
    end
  end
end
