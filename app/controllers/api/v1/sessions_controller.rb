class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: user_params[:email])
    if user && user.authenticate(params[:password])
      render json: user, status: :ok
    else
      render json: { error: "Invalid email or password" }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:session).permit(:email, :password)
  end
end

