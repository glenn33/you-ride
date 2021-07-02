class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :vehicle
  
  validates :date, presence: true, allow_blank: false
  validates :end_date, presence: true, allow_blank: false
  validate :end_date_after_start_date

  def end_date_after_start_date
    if end_date.present?
      errors.add(:end_date, "can't be before your start date!") if end_date <= date
    end
  end
end