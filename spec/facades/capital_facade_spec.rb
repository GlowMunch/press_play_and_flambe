require 'rails_helper'

RSpec.describe CapitalFacade do
  before :each do
    country_data
  end
  
  it 'creates a capital' do
    france = CapitalFacade.capital("france")
    expect(france).to be_a(Capital)
  end
end
