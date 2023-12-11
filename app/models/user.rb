class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  has_many :reservations
  has_many :bikes
end
