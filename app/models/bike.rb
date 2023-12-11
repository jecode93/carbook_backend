class Bike < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy

  validates :name, :image, :description, :deposit, :finance_fee, :option_to_purchase_fee,
            :total_amount_payable, :duration, presence: true
end
