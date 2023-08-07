class AirQualityFacade

  def self.air_quality(capital)
    json = AirService.capital_air(capital)

    air_data = Air.new(json)
    air_data
  end
end