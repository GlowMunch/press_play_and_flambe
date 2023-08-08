class CountryService
  def self.conn
    Faraday.new(url: "https://restcountries.com")
  end

  def self.country(country)
    response = conn.get("/v3.1/name/#{country}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
