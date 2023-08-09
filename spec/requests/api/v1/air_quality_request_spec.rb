require "rails_helper"

RSpec.describe "air quality search request" do
  before :each do
    air_data
    country_data
  end

  context "happy path" do
    it "can return a counties capital air quality" do

      get "/api/v1/air_quality?country=Nigeria"
      expect(response).to be_successful
    end
  end
end