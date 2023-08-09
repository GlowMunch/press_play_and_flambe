require 'rails_helper'

RSpec.describe EdamamService do

  before :each do
    recipe_data
  end

  it 'Connects with Recipe API' do
    @thai_recipe = EdamamService.new.search("thailand")
    @thai_recipe[:hits].each do |recipe|
      expect(recipe[:recipe]).to be_a(Hash)
      expect(recipe[:recipe][:label]).to be_a(String)
      expect(recipe[:recipe][:ingredientLines]).to be_a(Array)
      expect(recipe[:recipe][:calories]).to be_a(Float)
      expect(recipe[:recipe][:mealType]).to be_a(Array)
    end
  end
end
