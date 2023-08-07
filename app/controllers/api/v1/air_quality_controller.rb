class Api::V1::AirQualityController < ApplicationController
  def index
    capital = CapitalFacade.capital(params[:country])[0].capital
    air_quality = AirQualityFacade.air_quality(capital)
    render json: AirQualitySerializer.new(air_quality)
    require 'pry'; binding.pry
  end

  def show

  end
end