require 'rails_helper'

RSpec.describe "Users" do
  describe "POST /api/v1/users" do
    let(:user_params) do
      {
        user: {
          name: "Odell",
          email: "goodboy@ruffruff.com",
          password: "treats4lyf",
          password_confirmation: "treats4lyf"
        }
      }
    end

    it "creates a new user" do
      expect {
        post "/api/v1/users", params: user_params, as: :json
      }.to change(User, :count).by(1)

      expect(response).to have_http_status(:created)

      user = User.last
      expect(user.name).to eq("Odell")
      expect(user.email).to eq("goodboy@ruffruff.com")
    end

    it "returns the user details in the response" do
      post "/api/v1/users", params: user_params, as: :json

      expect(response).to have_http_status(:created)

      user = User.last
      expect(user[:name]).to eq("Odell")
      expect(user[:email]).to eq("goodboy@ruffruff.com")
      expect(user[:api_key]).to eq(user.api_key)
    end

    it "returns error if user creation fails" do

      user_params[:user][:password_confirmation] = "wrongP$assword"
      expect(user_params[:user][:password]).not_to eq(user_params[:user][:password_confirmation])
      expect(user_params[:user][:password]).to eq("treats4lyf")
      expect(user_params[:user][:password_confirmation]).to eq("wrongP$assword")

      expect {
        post "/api/v1/users", params: user_params, as: :json
      }.not_to change(User, :count)

      expect(response).to have_http_status(:unprocessable_entity)

      error_response = JSON.parse(response.body, symbolize_names: true)
      expect(error_response[:errors]).to include("Password confirmation doesn't match Password")
    end
  end
end
