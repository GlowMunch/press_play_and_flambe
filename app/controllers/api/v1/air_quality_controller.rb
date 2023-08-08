class Api::V1::AirQualityController < ApplicationController
  def index
    capital = CapitalFacade.capital(params[:country])
    city = capital.city
    air_quality = AirQualityFacade.air_quality(city)
    render json: AirQualitySerializer.new(air_quality, {params: {city: city}}).serializable_hash
  end
end
