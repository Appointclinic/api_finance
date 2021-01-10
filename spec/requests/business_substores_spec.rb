require 'rails_helper'

RSpec.describe "BusinessSubstores", type: :request do
  describe "GET /business_substores" do
    it "works! (now write some real specs)" do
      get business_substores_path
      expect(response).to have_http_status(200)
    end
  end
end
