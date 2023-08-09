class Api::V1::RecipesController < ApplicationController
  def index
    if params[:country].empty?
      recipe = EdamamFacade.recipe(CountryService.random)
      render json: RecipeSerializer.new(recipe)
    else
      recipe = EdamamFacade.recipe(params[:country])
      render json: RecipeSerializer.new(recipe)
    end
  end
end