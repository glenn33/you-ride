class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :vehicle

  validates :date, presence: true 
  validates :end_date, presence: true
  validate :end_date_after_start_date
  
 private

#    def smaller_than_end_date?
#      :date < :end_date
#    end
# end

  def end_date_after_start_date
      errors.add(:end_date, "can't be before your start date!") if end_date <= date
  end
end