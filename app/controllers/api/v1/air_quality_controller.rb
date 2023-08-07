class Api::V1::AirQualityController < ApplicationController
  def index
    capital = CapitalFacade.capital(params[:country])
    city = capital.city
    air_quality = AirQualityFacade.air_quality(city)

    render json: {
      data: {
        id: nil,
        type: 'air_quality',
        city: CitySerializer.new(capital).serializable_hash[:data][:attributes][:city],
        attributes: AirQualitySerializer.new(air_quality).serializable_hash[:data][:attributes]
      }
    }
  end
end
