require 'rails_helper'

RSpec.describe "Api::V1::Sessions", type: :request do
  describe "POST /api/v1/sessions" do
    it "logs in an existing user and returns the expected JSON response" do
      user = User.create!(
        name: "Odell",
        email: "goodboy@ruffruff.com",
        password: "treats4lyf",
        password_confirmation: "treats4lyf"
      )

      login_params = {
        email: user.email,
        password: "treats4lyf"
      }

      post "/api/v1/sessions", params: login_params, as: :json

      expect(response).to have_http_status(:ok)

      user_response = JSON.parse(response.body, symbolize_names: true)
      expect(user_response).to be_a(Hash)
      expect(user_response).to have_key(:api_key)
      expect(user_response[:api_key]).to eq(user.api_key)
      expect(user_response).to have_key(:email)
      expect(user_response[:email]).to eq(user.email)
      expect(user_response).to have_key(:name)
      expect(user_response[:name]).to eq(user.name)
      expect(user_response).to have_key(:id)
      expect(user_response[:id]).to eq(user.id)

    end
  end
end