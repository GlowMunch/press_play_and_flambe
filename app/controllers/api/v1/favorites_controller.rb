class Api::V1::FavoritesController < ApplicationController
  #refactor with strong params
  def create
    user = User.find_by(api_key: params[:api_key])
    if user
      favorite = user.favorites.create(
        country: params[:country],
        recipe_link: params[:recipe_link],
        recipe_title: params[:recipe_title]
      )
      if favorite.valid?
        render json: favorite, status: :created
      else
        render json: { errors: favorite.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { errors: "Invalid API key" }, status: :unprocessable_entity
    end
  end
end
