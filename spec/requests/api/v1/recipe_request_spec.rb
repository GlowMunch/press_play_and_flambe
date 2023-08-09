require "rails_helper"

RSpec.describe "Recipe Request" do
  before :each do
    air_data
    recipe_data
    country_data
  end

  context "happy path" do
    it "can respond with recipe from a searched country" do
      get "/api/v1/recipes?country=thailand"
      expect(response).to be_successful
    end
  end

  context "sad path" do
    xit "can randomly select a country if nothing is provided" do
      get "/api/v1/recipes?country="
      expect(response).to be_successful
    end
  end
end
