require 'rails_helper'

RSpec.describe Capital do

  it 'attributes' do
    response = File.read("spec/fixtures/france_response.json")

    country = Capital.new(JSON.parse(response, symbolize_names: true)[0])
    expect(country.city).to eq("Paris")
  end
end