class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :vehicle

  validates :date, presence: true #, if: :smaller_than_end_date?
  validates :end_date, presence: true

  # def smaller_than_end_date?
  #   @date < @end_date
  # end
end

