#spec/facades/file_name_spec.rb
require 'rails_helper'

RSpec.describe EdamamFacade do
  it 'creates a recipe', :vcr do

    response = File.read("spec/fixtures/recipe_response.json")
    stub_request(:get, "https://api.edamam.com/api/recipes/v2?app_id=b309863d&app_key=630fa3d32a523d174d51172ff767285f&q=thailand&type=public")
      .to_return(status: 200, body: response, headers: {})

    thailand = EdamamFacade.new.recipe("thailand")
    expect(thailand.first).to be_a(Recipe)
  end
end