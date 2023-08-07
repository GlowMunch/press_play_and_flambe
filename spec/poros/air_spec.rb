require 'rails_helper'

RSpec.describe Air do

  it 'attributes' do
    response = File.read("spec/fixtures/paris_air_response.json")
    stub_request(:get, "https://api.api-ninjas.com/v1/airquality?city=paris").
    with(
      headers: {
     'Accept'=>'*/*',
     'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
     'User-Agent'=>'Faraday v2.7.10',
     'X-Api-Key'=>'GxlpwJgf/k8D5IOkLy0GEw==TPvNIVnr29JhuiIN'
      }).
    to_return(status: 200, body: response, headers: {})


    paris_poro = AirQualityFacade.air_quality("paris")

    expect(paris_poro.id).to eq(nil)
    expect(paris_poro.aqi).to eq(102)
    expect(paris_poro.pm25_concentration).to eq(2.95)
    expect(paris_poro.co_concentration).to eq(216.96)


  end
end
