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
Category.destroy_all


puts 'Creating users...'

john = User.create!(
  first_name: 'John',
  email: "john@emile.com",
  password: "123456",
  birth_date: "19-04-17"
  )

jack = User.create!(
  first_name: 'Jack',
  email: "jack@emile.com",
  password: "123456",
  birth_date: "13-02-17"
  )


# puts 'Creating categories'

# category_1 = Category.create!(
#   name: "Un bon verre",
# )

# category_2 = Category.create!(
#   name: "Une bonne table",
# )

# category_3 = Category.create!(
#   name: "Du bon son",
# )

# sleep(2)
# puts 'Done'
