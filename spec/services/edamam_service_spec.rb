require 'rails_helper'

RSpec.describe EdamamService do

  it 'Connects with Recipe API' do
    json_response = File.read("spec/fixtures/recipe_response.json")
    stub_request(:get, "https://api.edamam.com/api/recipes/v2?app_id=b309863d&app_key=630fa3d32a523d174d51172ff767285f&q=thailand&type=public")
      .to_return(status: 200, body: json_response)

    @thai_recipe = EdamamService.new.search("thailand")
    @thai_recipe[:hits].each do |recipe|
      expect(recipe[:recipe]).to be_a(Hash)
      expect(recipe[:recipe][:ingredientLines]).to be_a(Array)
      expect(recipe[:recipe][:calories]).to be_a(Float)
      expect(recipe[:recipe][:mealType]).to be_a(Array)
    end
  end
end
