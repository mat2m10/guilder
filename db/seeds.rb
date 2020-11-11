require 'faker'
require "open-uri"
require 'date'

Booking.destroy_all
Craft.destroy_all
User.destroy_all

lat_init = 50.8461755
long_init = 4.4055443
dist = 0.05303020000000025
today = DateTime.now

10.times do
  user = User.create(email: Faker::Internet.email, username: Faker::Movies::LordOfTheRings, first_name: Faker::Movies::StarWars.planet, last_name: Faker::Movies::StarWars, password:'123456')
  file = URI.open('https://picsum.photos/200')
  user.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  user.save!
end

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

