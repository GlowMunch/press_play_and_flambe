require 'rails_helper'

RSpec.describe Air do

  it 'attributes' do
    response = File.read("spec/fixtures/paris_air_response.json")

    paris_poro = Air.new(JSON.parse(response, symbolize_names: true))

    expect(paris_poro.id).to eq(nil)
    expect(paris_poro.aqi).to eq(102)
    expect(paris_poro.pm25_concentration).to eq(2.95)
    expect(paris_poro.co_concentration).to eq(216.96)
  end
end
