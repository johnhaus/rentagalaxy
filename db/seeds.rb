# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts 'Cleaning database...'
Galaxy.destroy_all

puts 'Creating galaxies...'
9.times do
  galaxy = Galaxy.new(
  name: Faker::Space.unique.galaxy,
  description: Faker::Lorem.paragraph(sentence_count: 3),
  price: Faker::Number.within(range: 10000..100000),
  owner: Faker::Internet.unique.username
  )
  galaxy.save!
end

puts 'Finished!'

