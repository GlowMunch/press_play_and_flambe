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

end
