# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts 'Cleaning database...'
Place.destroy_all
Detail.destroy_all
User.destroy_all


puts 'Creating users...'

john = User.create!(
  first_name: 'John',
  email: "john@emile.com",
  password: "123456"
  )

jack = User.create!(
  first_name: 'Jack',
  email: "jack@emile.com",
  password: "123456"
  )


puts 'Creating places...'

le_perchoir = Place.create!(
  name: 'Le Perchoir',
  address: "14 Rue Crespin du Gast, 75011 Paris",
  type_of_place: "Un bon verre"
  )

mama_roma = Place.create!(
  name: 'Mama Roma',
  address: "90 Rue Oberkampf, 75011 Paris",
  type_of_place: "Une bonne table"
  )


puts 'Creating details...'

detail_1 = Detail.create!(
  comment: "Très cool comme bail!",
  user: john,
  place: mama_roma
  )

detail_2 = Detail.create!(
  comment: "La focaccia est vraiment ouf!",
  user: jack,
  place: mama_roma
  )

sleep(3)
puts 'Done'
