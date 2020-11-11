class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :craft
  validates :date, uniqueness: true, presence: true
  validates :description, presence: true
end
