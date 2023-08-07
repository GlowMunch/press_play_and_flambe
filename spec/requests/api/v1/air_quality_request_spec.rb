require "rails_helper"

RSpec.describe "air quality search request" do
  context "happy path" do
    it "can return a counties capital air quality" do
      get "/api/v1/air_quality?country=Nigeria"
      expect(response).to be_successful

      #       expect(response).to be_successful

#       expect(merchant).to be_a(Array)
#       expect(merchant.first[:attributes]).to be_a(Hash)
#       expect(merchant.first[:attributes]).to have_key(:name)
#       expect(merchant.first[:attributes][:name]).to eq("Largemouth Bass")
#     end
#   end
    end
  end
end