require "rails_helper"

RSpec.describe AirService do
  before :each do
    air_data
  end

  it "Conneccts to Air Quality API" do

    paris = AirService.capital_air("paris")
    expect(paris).to be_a(Hash)
    expect(paris[:"PM2.5"]).to be_a(Hash)
    expect(paris[:CO]).to be_a(Hash)
    expect(paris[:overall_aqi]).to be_a(Integer)
  end
end
