require "rails_helper"

RSpec.describe AirService do
  it "Conneccts to Air Quality API" do

    city_search = File.read("spec/fixtures/paris_air_response.json")
    stub_request(:get, "https://api.api-ninjas.com/v1/airquality?city=paris").
    with(
      headers: {
     'Accept'=>'*/*',
     'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
     'User-Agent'=>'Faraday v2.7.10',
     'X-Api-Key'=>'GxlpwJgf/k8D5IOkLy0GEw==TPvNIVnr29JhuiIN'
      }).
    to_return(status: 200, body: city_search, headers: {})


    paris = AirService.capital_air("paris")
    expect(paris).to be_a(Hash)
    expect(paris[:"PM2.5"]).to be_a(Hash)
    expect(paris[:CO]).to be_a(Hash)
    expect(paris[:overall_aqi]).to be_a(Integer)
  end
end
