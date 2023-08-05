#Create a service directory app/services/file_name_service.rb
class TmdbService
  def self.conn
    Faraday.new(url: 'https://api.themoviedb.org') do |f|
      f.params['api_key'] = ENV['tmdb_key']
  end

  def self.top_rated_movies(page_number)
    response = conn.get("/3/movie/top_rated?&page=#{page_number}")

    JSON.parse(response.body, symbolize_names: true)
  end
end