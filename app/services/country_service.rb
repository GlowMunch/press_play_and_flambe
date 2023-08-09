class CountryService
  def self.conn
    Faraday.new(url: "https://restcountries.com")
  end

  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.country(country)
    get_url("/v3.1/name/#{country}")
  end

  def self.all_countries
    get_url("/v3.1/all")
  end
end
