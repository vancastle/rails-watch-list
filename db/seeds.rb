# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "open-uri"
require "json"

puts "Suppression des films existants..."
Movie.destroy_all

# Utilisation de ta clé API dans l'URL
api_key = "2c3ab11909d2c9cad414c7c0d524e2e4"
url = "https://tmdb.lewagon.com/movie/top_rated?api_key=#{api_key}"

puts "Récupération des films depuis l'API TMDB..."
movies_serialized = URI.open(url).read
movies = JSON.parse(movies_serialized)["results"]

movies.each do |movie|
  Movie.create!(
    title: movie["title"],
    overview: movie["overview"],
    poster_url: "https://image.tmdb.org/t/p/w500#{movie["poster_path"]}",
    rating: movie["vote_average"]
  )
end

puts "Films importés avec succès ! 🎬"
