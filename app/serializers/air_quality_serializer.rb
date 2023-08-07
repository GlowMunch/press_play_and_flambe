class AirQualitySerializer
  include JSONAPI::Serializer
  attributes :id, :aqi, :pm25_concentration, :co_concentration
end