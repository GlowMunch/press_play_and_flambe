require 'rails_helper'

RSpec.describe CapitalFacade do
  it 'creates a capital' do

    response = File.read("spec/fixtures/france_response.json")
    stub_request(:get, "https://restcountries.com/v3.1/name/france")
      .to_return(status: 200, body: response, headers: {})

    france = CapitalFacade.capital("france")
    expect(france).to be_a(Capital)
  end
end