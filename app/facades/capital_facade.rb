class CapitalFacade

  def self.capital(country)
    json = CountryService.country(country)

    capital = Capital.new(json[0])
    capital
  end
end