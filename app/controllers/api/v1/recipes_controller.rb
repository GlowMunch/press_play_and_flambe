class Api::V1::RecipesController < ApplicationController
  def index
    recipe = EdamamFacade.recipe(params[:country])
    render json: RecipeSerializer.new(recipe)
  end
end