class CapitalFacade

  def self.capital(country)
    json = CountryService.country(country)

    capital = Capital.new(json)
    capital
  end
end