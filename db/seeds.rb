# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'json'
require 'rest-client'

Movie.destroy_all
response = RestClient.get 'https://tmdb.lewagon.com/movie/top_rated'
response_ids = JSON.parse(response)

response_ids['results'].each do |movie|
  puts 'Creating movie'
  new_movie = Movie.new(
    title: movie['original_title'],
    overview: movie['overview'],
    poster_url: movie['poster_path']
  )
  new_movie.save!
  puts 'Finished!'
end
