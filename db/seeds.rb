# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'cleaning DB'
Tour.destroy_all
puts 'DB Tours destroyed'
User.destroy_all
puts 'DB User destroyed'


# puts 'creating user 1..'
# user1 = User.new
# user1.email = 'marine@sourin.com'
# user1.password = 'marinesourin'
# user1.first_name = 'Marine'
# user1.last_name = 'Sourin'
# user1.save!
# puts 'user 1 created !'

# puts 'creating user 2..'
# user2 = User.new
# user2.email = 'jules@rivoire.com'
# user2.password = 'julesrivoire'
# user2.first_name = 'Jules'
# user2.last_name = 'Rivoire'
# user2.save!
# puts 'user 2 created !'

# puts 'creating user 3..'
# user3 = User.new
# user3.email = 'yohan@bendavid.com'
# user3.password = 'yoanbendavid'
# user3.first_name = 'Yohan'
# user3.last_name = 'Bendavid'
# user3.save!
# puts 'user 3 created !'

# puts 'creating user 4..'
# user4 = User.new
# user4.email = 'guitou@imary.com'
# user4.password = 'guitouimary'
# user4.first_name = 'Guitou'
# user4.last_name = 'Imary'
# user4.save!
# puts 'user 4 created !'

puts 'Creating some tours..'
20.times do
  Tour.create!({
    name: Faker::DcComics.title,
    price: Faker::Commerce.price.to_i,
    description: 'Lorem[10]',
    city: ['Montmartre, Paris', 'Kingscross, City of London', 'Piazza San Marco, Venezia', 'Berlin', 'Lille', 'Tour Eiffel, Paris', 'Le Perchoir, Montmartre', 'Palais Princier, Monaco', 'Biarritz', 'Vannes'].sample,
    user: User.all.sample
  })
end
puts 'Tours created'

puts 'Everything is ready guys!!'
