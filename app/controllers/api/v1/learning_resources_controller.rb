class Api::V1::LearningResourcesController < ApplicationController
  def index
    resources = LearningResourcesFacade.new.learning_results(params[:country])
    render json: LearningResourcesSerializer.new(resources)
  end
end