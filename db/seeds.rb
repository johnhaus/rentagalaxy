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

galaxy_4 = Galaxy.new(name: "Fourth", description: "Fourth Galaxy")
galaxy_4.save!

galaxy_5 = Galaxy.new(name: "Fifth", description: "Fifth Galaxy")
galaxy_5.save!

galaxy_6 = Galaxy.new(name: "Sixth", description: "Sixth Galaxy")
galaxy_6.save!

galaxy_7 = Galaxy.new(name: "Seventh", description: "Seventh Galaxy")
galaxy_7.save!

galaxy_8 = Galaxy.new(name: "Eighth", description: "Eighth Galaxy")
galaxy_8.save!

galaxy_9 = Galaxy.new(name: "Ninth", description: "Ninth Galaxy")
galaxy_9.save!
puts 'Finished!'
