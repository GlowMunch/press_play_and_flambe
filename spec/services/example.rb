# #spec/services/file_name_service_spec.rb
# require 'rails_helper'

# RSpec.describe TmdbService do
#   let(:top_rated) { TmdbService.top_rated_movies(1) }

#   it 'establishes a connection for top rated movies', :vcr do
#     expect(top_rated).to be_a(Hash)
#     expect(top_rated[:results]).to be_a(Array)
#     expect(top_rated[:results].first[:title]).to be_a(String)
#     expect(top_rated[:results].first[:title]).to eq('Your Eyes Tell')
# end