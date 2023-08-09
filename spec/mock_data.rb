def recipe_data
  thailand_recipe = File.read("spec/fixtures/recipe_response.json")
  tuvalu_search = File.read("spec/fixtures/tuvalu_response.json")


  stub_request(:get, "https://api.edamam.com/api/recipes/v2?app_id=b309863d&app_key=630fa3d32a523d174d51172ff767285f&q=thailand&type=public")
  .to_return(status: 200, body: thailand_recipe, headers: {})
  stub_request(:get, "https://api.edamam.com/api/recipes/v2?app_id=b309863d&app_key=630fa3d32a523d174d51172ff767285f&q=tuvalu&type=public")
    .to_return(status: 200, body: tuvalu_search, headers: {})
end

def youtube_data

end

def country_data
  france_search = File.read("spec/fixtures/france_response.json")
  nigeria_search = File.read("spec/fixtures/nigeria_response.json")
  all_countries = File.read("spec/fixtures/all_countries_response.json")

  stub_request(:get, "https://restcountries.com/v3.1/name/france")
    .to_return(status: 200, body: france_search, headers: {})
  stub_request(:get, "https://restcountries.com/v3.1/name/Nigeria")
    .to_return(status: 200, body: nigeria_search, headers: {})
  stub_request(:get, "https://restcountries.com/v3.1/all")
    .to_return(status: 200, body: all_countries, headers: {})
end

def air_data
  paris_search = File.read("spec/fixtures/paris_air_response.json")
  abuja_search = File.read("spec/fixtures/abuja_air_response.json")

  stub_request(:get, "https://api.api-ninjas.com/v1/airquality?city=paris").
  with(
    headers: {
   'Accept'=>'*/*',
   'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
   'User-Agent'=>'Faraday v2.7.10',
   'X-Api-Key'=>'GxlpwJgf/k8D5IOkLy0GEw==TPvNIVnr29JhuiIN'
    }).
  to_return(status: 200, body: paris_search, headers: {})

  stub_request(:get, "https://api.api-ninjas.com/v1/airquality?city=Abuja").
  with(
    headers: {
   'Accept'=>'*/*',
   'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
   'User-Agent'=>'Faraday v2.7.10',
   'X-Api-Key'=>'GxlpwJgf/k8D5IOkLy0GEw==TPvNIVnr29JhuiIN'
    }).
  to_return(status: 200, body: abuja_search, headers: {})
end