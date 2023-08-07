class AirService
  def self.conn
    Faraday.new("https://api.api-ninjas.com") do |f|
      f.headers["X-Api-Key"] = ENV["air_key"]
    end
  end

  def self.capital_air(input)
    response = conn.get("/v1/airquality?city=#{input}")


    JSON.parse(response.body, symbolize_names: true)
  end
end