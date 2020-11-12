class User < ApplicationRecord
  has_many :bookings
  has_many :booked_crafts, through: :bookings, source: :craft #User qui ne sont pas des craftsmen
  has_many :crafts
  has_many :craft_bookings, through: :crafts, source: :bookings

  has_one_attached :photo
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
