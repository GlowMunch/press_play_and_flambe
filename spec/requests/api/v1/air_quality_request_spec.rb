require "rails_helper"

RSpec.describe "air quality search request" do
  context "happy path" do
    it "can return a counties capital air quality" do

      country = File.read("spec/fixtures/nigeria_response.json")
      stub_request(:get, "https://restcountries.com/v3.1/name/Nigeria")
        .to_return(status: 200, body: country, headers: {})

      air = File.read("spec/fixtures/abuja_air_response.json")
      stub_request(:get, "https://api.api-ninjas.com/v1/airquality?city=Abuja").
      with(
        headers: {
       'Accept'=>'*/*',
       'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       'User-Agent'=>'Faraday v2.7.10',
       'X-Api-Key'=>'GxlpwJgf/k8D5IOkLy0GEw==TPvNIVnr29JhuiIN'
        }).
      to_return(status: 200, body: air, headers: {})

      get "/api/v1/air_quality?country=Nigeria"
      expect(response).to be_successful
    end
  end
end