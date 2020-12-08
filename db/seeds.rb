require 'faker'
require "open-uri"
require 'date'

puts "Destroying current bookings/crafts/users..."

Booking.destroy_all
Craft.destroy_all
User.destroy_all

lat_init = 50.8461755
long_init = 4.4055443
dist = 0.05303020000000025
today = DateTime.now

puts "Creating batman user..."

first = User.create(email: "b@t.man", username: "batman", first_name: "Bruce", last_name: "Wayne", password:'123456')
first.about = "I am Batman!!!"
first.save!

puts "Creating 10 other LOTR users..."

10.times do
  about = ""
  10.times do
    about += "#{Faker::Movies::Hobbit.quote} "
  end
  user = User.create(email: Faker::Internet.email, username: Faker::Movies::LordOfTheRings.character, first_name: Faker::Movies::StarWars.planet, last_name: Faker::Movies::StarWars.droid, password:'123456')
  coin = rand(2)+1
  if coin == 1
    file = URI.open("https://randomuser.me/api/portraits/women/#{rand(99)}.jpg")
  else
    file = URI.open("https://randomuser.me/api/portraits/men/#{rand(99)}.jpg")
  end
  user.about = about
  user.photo.attach(io: file, filename: 'nes.png', content_type: 'image/jpg')
  user.save!
end

puts "Creating 10 random crafts..."

10.times do
  string = ""
  10.times do
    string += "#{Faker::TvShows::GameOfThrones.quote} "
  end
  file = URI.open('https://picsum.photos/200')
  craft = Craft.create(name: Faker::Commerce.department, price: rand(100), user_id: User.all.sample.id.to_i, description: string)
  craft.photo.attach(io: file, filename: '.png', content_type: 'image/png')
  craft.latitude = lat_init + (rand * dist)
  craft.longitude = long_init + (rand * dist)
  craft.address = Faker::Address.street_address
  craft.save!
end

puts "Creating 10 bookings..."

10.times do
  date = today + rand(1000)
  user = User.all.sample.id.to_i
  craft = Craft.all.sample.id.to_i
  text = ""
  10.times do
    text += "#{Faker::TvShows::HowIMetYourMother.quote} "
  end
  booking = Booking.create(date: date, user_id: user, craft_id: craft, description: text)
  booking.save!
end

puts "Done bro!!!!!"

