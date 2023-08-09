class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      coockie[:api_key] = user.api_key
      session[:user_id] = user.id
      render json: user, status: :ok
    else
      render json: { error: "Invalid email or password" }, status: :unprocessable_entity
    end
  end
end

