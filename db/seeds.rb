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
