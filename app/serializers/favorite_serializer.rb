class FavoriteSerializer
  include JSONAPI::Serializer
  attributes :recipe_title, :recipe_link, :country
  set_type :favorite
end

#find way to use active model serializer
