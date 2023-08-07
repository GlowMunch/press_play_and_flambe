class CapitalFacade

  def self.capital(country)
    json = CountryService.country(country)
    @capital = json.map { |details| Capital.new(details) }
  end
end