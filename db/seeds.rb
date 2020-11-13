require 'faker'
require "open-uri"
require 'date'

Booking.destroy_all
Craft.destroy_all
User.destroy_all

today = DateTime.now

first = User.create(email: "b@t.man", username: "batman", first_name: "Bruce", last_name: "Wayne", password:'123456')
file = URI.open('https://www.pngkit.com/png/detail/6-61591_batman-icon-jira-avatar.png')
first.photo.attach(io: file, filename: 'bat.png', content_type: 'image/png')
first.about = "I am Batman!!!"
first.save!

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

10.times do
  string = ""
  address_array = ["Romeinsesteenweg 950, 1780 Wemmel","Avenue Charles Quint, 560 Parking Carrefour 1082, 8 Brussel","Rue du Progrès 76/1030, 1030 Brussel","Rue du Marché Aux Herbes 101, 1000 Bruxelles","Boulevard De La Woluwe 70 20 BE, b25, 1200 Brussel","Rue Veydt 43, 1050 Bruxelles","Gare du Midi 46 b 23, 1060 Bruxelles","Boulevard Boulevard Anspach 56-58 1000, 1 Bruxelles","Chaussée de Boondael 462 - Ixelles / Ixelles, 1050 Brussel","Rue Veydt 43, 1050 Bruxelles","Avenue de la Toison d'Or 4, 1050 Ixelles","Centraal Station, Rue de la Madeleine, 1000 Bruxelles","Leuvensesteenweg 12, 1932 Zaventem","Chaussée de Haecht 1420, 1130 Bruxelles"]
  10.times do
    string += "#{Faker::TvShows::GameOfThrones.quote} "
  end
  file = URI.open('https://picsum.photos/200')
  craft = Craft.create(name: Faker::Commerce.department, price: rand(100), user_id: User.all.sample.id.to_i, description: string)
  craft.photo.attach(io: file, filename: '.png', content_type: 'image/png')
  craft.address = address_array.sample
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

