require 'rails_helper'

RSpec.describe AirQualityFacade do
  before :each do
    air_data
  end

  it 'creates a air quality data' do
    paris_air = AirQualityFacade.air_quality("paris")
    expect(paris_air).to be_a(Air)
  end
end
