# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
user = User.new(
  first_name: "Kiki",
  last_name: "KoKo"
  )
puts 'Creating 100 fake tours...'
100.times do
  tours = Tour.new(
    name:    Faker::TvShows::RickAndMorty.location,
    price:  rand(0..1000),
    description: Faker::Quote,
    city: Faker::Address.city,
    user_id: 1
  )
  tours.save!
end
puts 'Finished!'
