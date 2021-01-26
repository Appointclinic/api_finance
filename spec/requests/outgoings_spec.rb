require 'rails_helper'

RSpec.describe "Outgoings", type: :request do
  describe "GET /outgoings" do
    it "works! (now write some real specs)" do
      get outgoings_path
      expect(response).to have_http_status(200)
    end
  end
end
