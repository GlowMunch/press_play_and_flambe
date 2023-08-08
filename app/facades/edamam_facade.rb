class EdamamFacade

  def recipe(country)
    json = service.search(country)
    @recipe = json[:hits].map { |details| Recipe.new(details) }
  end

  private

  def service
    EdamamService.new
  end
end
