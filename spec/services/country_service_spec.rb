require "rails_helper"


RSpec.describe CountryService do
  before :each do
    country_data
  end
  it "Connects to Country Rest API" do
    france = CountryService.country("france")
    all = CountryService.all_countries
    random = CountryService.random

    expect(france[0]).to be_a(Hash)
    expect(france[0][:capital]).to be_a(Array)
    expect(france[0][:capital][0]).to eq("Paris")
    expect(france[0][:capital][0]).to be_a(String)

    expect(all[0][:name][:common]).to eq("Saudi Arabia")

    expect(random).to be_a(String)
  end
end
