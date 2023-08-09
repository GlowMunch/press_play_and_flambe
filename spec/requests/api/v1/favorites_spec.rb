require 'rails_helper'

RSpec.describe "Api::V1::Favorites", type: :request do
  describe "POST /api/v1/favorites" do
    it "creates favorite for user" do
      blaine = User.create!(
        name: "Odell",
        email: "goodboy@ruffruff.com",
        password: "treats4lyf",
        password_confirmation: "treats4lyf"
      )
      favorite_params = {
        api_key: blaine.api_key,
        country: "Home Cookin!!",
        recipe_link: "https://www.seriouseats.com/the-food-labs-ultra-gooey-stovetop-mac-cheese",
        recipe_title: "The Food Lab's Ultra-Gooey Stovetop Mac"
      }

      expect {
        post "/api/v1/favorites", params: favorite_params, as: :json
      }.to change(Favorite, :count).by(1)

      expect(response).to have_http_status(:created)

      favorite = Favorite.last
      expect(favorite.country).to eq("Home Cookin!!")
      expect(favorite.recipe_link).to eq("https://www.seriouseats.com/the-food-labs-ultra-gooey-stovetop-mac-cheese")
      expect(favorite.recipe_title).to eq("The Food Lab's Ultra-Gooey Stovetop Mac")
      expect(favorite.user).to eq(blaine)
    end

    it "returns error if user's API key is not valid" do
      favorite_params = {
        api_key: "woopsnokey",
        country: "Home Cookin!!",
        recipe_link: "https://www.seriouseats.com/the-food-labs-ultra-gooey-stovetop-mac-cheese",
        recipe_title: "The Food Lab's Ultra-Gooey Stovetop Mac"
      }

      post "/api/v1/favorites", params: favorite_params, as: :json

      expect(response).to have_http_status(:unprocessable_entity)

      error_response = JSON.parse(response.body, symbolize_names: true)
      expect(error_response[:errors]).to include("Invalid API key")
    end

    it "returns error if required parameters are missing" do
      stuart = User.create!(
        name: "Stuwu",
        email: "bigstu@emailz.com",
        password: "AllDay",
        password_confirmation: "AllDay",
        api_key: SecureRandom.hex(16)
      )

      favorite_params = {
        api_key: stuart.api_key,
      }

      post "/api/v1/favorites", params: favorite_params, as: :json

      expect(response).to have_http_status(:unprocessable_entity)

      error_response = JSON.parse(response.body, symbolize_names: true)
      expect(error_response[:errors]).to include("Country can't be blank", "Recipe link can't be blank", "Recipe title can't be blank")
    end
  end

  describe "GET /api/v1/favorites" do
    it "returns favorite recipes" do
      blaine = User.create!(
        name: "Glow",
        email: "me@gmail.com",
        password: "thisisatest",
        password_confirmation: "thisisatest",
        api_key: SecureRandom.hex(16)
      )

      favorite1 = Favorite.create!(
        user: blaine,
        recipe_title: "Good Pie",
        recipe_link: "http://www.pie.com/good",
        country: "Guatemala",
        created_at: "2023-11-02T02:17:54.111Z"
      )

      favorite2 = Favorite.create!(
        user: blaine,
        recipe_title: "Captain Crunch",
        recipe_link: "https://www.milk.com/yum",
        country: "Turykey",
        created_at: "2021-10-07T03:44:08.917Z"
      )

      headers = {
        "ACCEPT" => "application/json",
        "HTTP_API_KEY" => blaine.api_key
      }

      get "/api/v1/favorites", headers: headers

      expect(response).to have_http_status(:ok)
    end

    it "returns an error if API key is invalid" do
      blaine = User.create!(
        name: "Glow",
        email: "me@gmail.com",
        password: "thisisatest",
        password_confirmation: "thisisatest",
        api_key: SecureRandom.hex(16)
      )

      favorite1 = Favorite.create!(
        user: blaine,
        recipe_title: "Good Pie",
        recipe_link: "http://www.pie.com/good",
        country: "Guatemala",
        created_at: "2023-11-02T02:17:54.111Z"
      )

      favorite2 = Favorite.create!(
        user: blaine,
        recipe_title: "Captain Crunch",
        recipe_link: "https://www.milk.com/yum",
        country: "Turykey",
        created_at: "2021-10-07T03:44:08.917Z"
      )
      headers = {
        "ACCEPT" => "application/json",
        "HTTP_API_KEY" => "badkey"
      }

      get "/api/v1/favorites", headers: headers

      expect(response).to have_http_status(:bad_request)

      error_response = JSON.parse(response.body, symbolize_names: true)
      expect(error_response[:error]).to eq("Invalid API key")
    end
  end
end

