require "rails_helper"

RSpec.describe CountryService do
  it "Connects to Country Rest API" do
    france_search = File.read("spec/fixtures/france_response.json")
    stub_request(:get, "https://restcountries.com/v3.1/name/france")
      .to_return(status: 200, body: france_search, headers: {})

    france = CountryService.country("france")

    expect(france[0]).to be_a(Hash)
    expect(france[0][:capital]).to be_a(Array)
    expect(france[0][:capital][0]).to be_a(String)
  end
end