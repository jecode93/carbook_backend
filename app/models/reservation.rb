class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :bike

  validates :city, presence: true
  validates :date, presence: true
  validates :user_id, presence: true
  validates :bike_id, presence: true
end
