# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Bike.create!(
      name: 'first bike',
      description: 'this is my first bike',
      deposit: '2000',
      finance_fee: '500',
      option_to_purchase_fee: '200',
      total_amount_payable: '100',
      duration: '50'
)
