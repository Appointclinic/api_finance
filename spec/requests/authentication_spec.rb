require 'rails_helper'

RSpec.describe 'User authentication', type: :request do
  describe 'GET /auth' do
    before do
      company = create(:company)
      company_unity = create(:company_unity, company: company)
      @user = create(:user, :common, :with_password, company_unity: company_unity, email: "authentication_test@email.com")
    end

    it 'return authentication data if login data is correct' do
      post '/auth/sign_in', params: {"email": @user.email, "password": "123456"}

      expect(response).to have_http_status(200)
      expect(response.header['uid']).to eq("authentication_test@email.com")
    end

    it 'return 401 if login data is incorrect' do
      post '/auth/sign_in', params: {"email": @user.email, "password": "1234567"}

      expect(response).to have_http_status(401)
    end
  end
end
