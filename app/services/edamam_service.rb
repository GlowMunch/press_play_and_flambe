#Create a service directory app/services/file_name_service.rb
class EdamamService
  def conn(country)
    Faraday.new(url: 'https://api.edamam.com/api/recipes/v2') do |f|
      f.params['app_key'] = ENV['EDAMAM_API_KEY']
      f.params['app_id'] = ENV['EDAMAM_APP_ID']
      f.params['type'] = ENV['TYPE']
      f.params['q'] = (country)
    end
  end

  def search(country)
    response = conn(country).get
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def delete_url(url)
    response = conn.delete(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def patch_url(url, params)
    response = conn.patch(url, params)
    JSON.parse(response.body, symbolize_names: true)
  end

  def post_url(url, params)
    response = conn.post(url, params)
    JSON.parse(response.body, symbolize_names: true)
  end

  def friend_post_url(url, params)
    conn.post(url, params)
  end
end

  # def conn
  #   ## Alway comment this in before pushing to production
  #   # Faraday.new(url: "render")
  #   Faraday.new(url: "http://localhost:3000")
  #   # change to http://localhost:3000 for local testing if needed
  # end
# end
