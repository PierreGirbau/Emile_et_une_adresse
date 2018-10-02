

p users = User.all.each { |user| p "#{user.first_name} - #{user.email}"}

# puts 'Creating users...'

# john = User.create!(
#   first_name: 'John',
#   email: "john@emile.com",
#   password: "123456",
#   birth_date: "19-04-17"
#   )

# jack = User.create!(
#   first_name: 'Jack',
#   email: "jack@emile.com",
#   password: "123456",
#   birth_date: "13-02-17"
#   )
