class Vehicle < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  validates :location, presence: true
  validates :price, presence: true
  validates :title, presence: true, length: {minimum: 8}
  validates :description, presence: true, length: {minimum: 8}
  validates :category, presence: true
end
