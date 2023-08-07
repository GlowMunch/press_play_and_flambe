module Api
  module V1
    class AirQualityController < ApplicationController
      def show
        country = params[:country]
        capital = CountryService.

        render json: AirQualitySerializer.new(country)
      end
    end
  end
end