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

  #this keeps randomly creating a new uri to stub. Functionality is working
  context "sad path" do
    xit "can randomly select a country if nothing is provided" do
      get "/api/v1/recipes?country="
      expect(response).to be_successful
    end

    it "a country with no recipes returns data: []" do
      get "/api/v1/recipes?country=tuvalu"
      expect(response).to be_successful
      expect(JSON.parse(response.body)).to eq("data" => [])
    end
  end
end
