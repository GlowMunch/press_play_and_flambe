#spec/facades/file_name_spec.rb
require 'rails_helper'

RSpec.describe EdamamFacade do
  before :each do
    recipe_data
  end

  it 'creates a recipe' do
    thailand = EdamamFacade.recipe("thailand")
    expect(thailand.first).to be_a(Recipe)
      thailand.each do |data|
        expect(data.image).to be_a(String)
        expect(data.title).to be_a(String)
        expect(data.url).to be_a(String)
      end
  end
end