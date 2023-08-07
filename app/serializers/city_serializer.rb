class CitySerializer
  include JSONAPI::Serializer
  attributes :id , :type = "air_quality"

  attribute :city do |object|

    object.city
  end
end