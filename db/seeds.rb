require 'faker'
require "open-uri"

Craft.destroy_all
User.destroy_all

10.times do
  user = User.create(email: Faker::Internet.email, username: Faker::Movies::LordOfTheRings, first_name: Faker::Movies::StarWars.planet, last_name: Faker::Movies::StarWars, password:'123456')
  file = URI.open('https://picsum.photos/200')
  user.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  user.save!
end

10.times do
  string = ""
  10.times do
    string += " #{Faker::Games::HeroesOfTheStorm.battleground}"
  end
  file = URI.open('https://picsum.photos/200')
  craft = Craft.create(name: Faker::Commerce.department, price: rand(100), user_id: User.all.sample.id.to_i, description: string)
  craft.photo.attach(io: file, filename: '.png', content_type: 'image/png')
  # binding.pry
  craft.save!
end
