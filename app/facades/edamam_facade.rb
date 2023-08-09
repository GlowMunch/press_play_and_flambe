class EdamamFacade

  def self.recipe(country)
    json = EdamamService.new.search(country)

    if json[:hits].empty?
        json[:hits]
    else
      @recipe = json[:hits].map { |details| Recipe.new(details) }
    end
  end

  private

end
