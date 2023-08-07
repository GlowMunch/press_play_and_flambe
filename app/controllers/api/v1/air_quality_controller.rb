class Api::V1::AirQualityController < ApplicationController
  def index
    capital = CapitalFacade.capital(params[:country]).city
    air_quality = AirQualityFacade.air_quality(capital)
    render json: AirQualitySerializer.new(air_quality)
  end
end
