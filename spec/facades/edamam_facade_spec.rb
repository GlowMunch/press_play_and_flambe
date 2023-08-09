#spec/facades/file_name_spec.rb
require 'rails_helper'

RSpec.describe EdamamFacade do
  before :each do
    recipe_data
  end

  it 'creates a recipe' do
    thailand = EdamamFacade.new.recipe("thailand")
    expect(thailand.first).to be_a(Recipe)
  end
end