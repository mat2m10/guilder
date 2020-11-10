require 'faker'

Craft.destroy_all
User.destroy_all

100.times do
  user = User.create(name: )
end
10.times do
  craft = Craft.create(name: 'Service', price: rand(100), user_id:1)
  craft.save!
end
