class Bike < ApplicationRecord
  has_many :reservations, dependent: :destroy
end
