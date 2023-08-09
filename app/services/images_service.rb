class ImagesService
  def conn
    Faraday.new(url: "https://api.unsplash.com") do |f|
      f.params['client_id'] = ENV['splash']
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def photos(country)
    get_url("/search/photos?page=1&query=#{country}")
  end
end
