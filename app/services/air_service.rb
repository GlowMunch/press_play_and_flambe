class AirService
  def self.conn
    Faraday.new("https://api.api-ninjas.com/v1") do |f|
      f.params["X-Api-Key"] = ENV["air_key"]
    end
  end

  def self.capital_search(input)
    response = conn.get("/airquality?city=#{input}")
    JSON.parse(response.body, symbolize_names: true)
  end
end