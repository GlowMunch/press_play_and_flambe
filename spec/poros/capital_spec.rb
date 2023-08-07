require 'rails_helper'

RSpec.describe Capital do

  it 'attributes' do
    response = File.read("spec/fixtures/france_response.json")
    stub_request(:get, "https://restcountries.com/france")
      .to_return(status: 200, body: response, headers: {})


    country = CapitalFacade.capital("france")
    expect(country.capital).to eq("Paris")

  end
end