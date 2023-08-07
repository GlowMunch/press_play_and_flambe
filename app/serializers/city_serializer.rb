class CitySerializer < ActiveModel::Serializer
  attributes :id , :type = "air_quality", :city
end