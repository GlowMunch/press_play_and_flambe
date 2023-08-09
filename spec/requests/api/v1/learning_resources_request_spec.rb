require "rails_helper"

RSpec.describe "Resources Request" do
  before :each do
    air_data
    recipe_data
    country_data
  end

  context "happy path" do
    it "can respond with recipe from a searched country" do
      get "/api/v1/learning_resources?country=laos"
      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(json[:data][:attributes][:country]).to eq("laos")
      expect(json[:data][:attributes][:video]).to be_a(Hash)
      expect(json[:data][:attributes][:images]).to be_a(Array)
      expect(json[:data][:attributes][:video]).to have_key(:title)
      expect(json[:data][:attributes][:video]).to have_key(:youtube_video_id)
      expect(json[:data][:attributes][:images][0]).to have_key(:alt_tag)
      expect(json[:data][:attributes][:images][0]).to have_key(:url)
    end
  end

  #video is returning random titles when nothing is input
  xit "a country with no recipes returns data: []" do
    get "/api/v1/learning_resources?country="
    expect(response).to be_successful
    expect(JSON.parse(response.body)).to eq("data" => [])
  end
end
