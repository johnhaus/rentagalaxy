# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning database...'
Galaxy.destroy_all

puts 'Creating galaxies...'
galaxy_1 = Galaxy.new(name: "First", description: "First Galaxy")
galaxy_1.save!

galaxy_2 = Galaxy.new(name: "Second", description: "Second Galaxy")
galaxy_2.save!

galaxy_3 = Galaxy.new(name: "Third", description: "Third Galaxy")
galaxy_3.save!
puts 'Finished!'
