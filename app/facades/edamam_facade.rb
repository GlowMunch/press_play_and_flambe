class EdamamFacade

  def self.recipe(country)
    json = EdamamService.new.search(country)
    @recipe = json[:hits].map { |details| Recipe.new(details) }
  end

  private
end
