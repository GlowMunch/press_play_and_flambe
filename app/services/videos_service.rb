class VideosService
  def conn
    Faraday.new(url: "https://www.googleapis.com") do |f|
      f.params["key"] = ENV["tube_key"]
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  #refactor to iterate attributes into uri
  def vid_search(search)
    get_url("/youtube/v3/search?&q=#{search}&channelid=UCluQ5ylneAkkeCndNnUhpw&part=snippet")
  end
end
