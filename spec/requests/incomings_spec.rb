require 'rails_helper'

RSpec.describe "Incomings", type: :request do
  describe "GET /incomings" do
    it "works! (now write some real specs)" do
      get incomings_path
      expect(response).to have_http_status(200)
    end
  end
end
