# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

50.times do
  Movie.create(title: Faker::Movie.quote)
end

20.times do |x|
  s = Season.create(title: Faker::Movie.quote, number: x)
  rand(10).times do |ep|
    s.episodes.create(title: Faker::Movie.quote, number_in_season: ep )
  end
end

