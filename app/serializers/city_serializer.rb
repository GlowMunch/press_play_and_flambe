class CitySerializer
  include JSONAPI::Serializer
  set_type :air_quality
  attributes :city

  attribute :city do |object|
    object.city
  end
end