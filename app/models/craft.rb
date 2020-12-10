class Craft < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :users, through: :bookings
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model

  pg_search_scope :search_by_name,
                  against: %i[name address],
                  using: {
                    tsearch: { prefix: true } # <-- now it will return something!
                  }
end
