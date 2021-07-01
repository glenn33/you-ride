class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :vehicle

  validates :date, presence: true
  validates :end_date, presence: true
end
