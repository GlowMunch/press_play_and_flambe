require 'rails_helper'

RSpec.describe AirQualityFacade do
  it 'creates a air quality data' do

    response = File.read("spec/fixtures/paris_air_response.json")
    stub_request(:get, "https://api.api-ninjas.com/airquality?city=paris").
    with(
      headers: {
     'Accept'=>'*/*',
     'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
     'User-Agent'=>'Faraday v2.7.10',
     'X-Api-Key'=>'GxlpwJgf/k8D5IOkLy0GEw==TPvNIVnr29JhuiIN'
      }).
    to_return(status: 200, body: response, headers: {})

    paris_air = AirQualityFacade.air_quality("paris")
    expect(paris_air).to be_a(Air)
  end
end