require 'rails_helper'

RSpec.describe Bike, type: :model do
  it 'is valid with valid attributes' do
    user = User.create(username: 'testuser')
    bike = Bike.new(
      user:,
      name: 'Bikeys',
      image: 'https://www.statebicycle.com/cdn/shop/products/6061-eBikeCommuter-MatteBlack_1.jpg?v=1684443969',
      description: 'description',
      deposit: 2000.00,
      finance_fee: 1000.00,
      option_to_purchase_fee: 100.0,
      total_amount_payable: 200.0,
      duration: 2
    )
    expect(bike).to be_valid
  end

  it 'is not valid without a user' do
    bike = Bike.new
    expect(bike).to_not be_valid
  end

  it 'has many reservations' do
    user = User.create(username: 'testuser')
    bike = Bike.create(
      user:,
      name: 'Bikeys',
      image: 'https://www.statebicycle.com/cdn/shop/products/6061-eBikeCommuter-MatteBlack_1.jpg?v=1684443969',
      description: 'description',
      deposit: 2000.00,
      finance_fee: 1000.00,
      option_to_purchase_fee: 100.0,
      total_amount_payable: 200.0,
      duration: 2
    )
    reservation1 = bike.reservations.create(city: 'China', user_id: user, date: Date.today)
    reservation2 = bike.reservations.create(city: 'China', user_id: user, date: Date.tomorrow)

    expect(bike.reservations).to include(reservation1, reservation2)
  end

  it { should belong_to(:user) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:image) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:deposit) }
  it { should validate_presence_of(:finance_fee) }
  it { should validate_presence_of(:option_to_purchase_fee) }
  it { should validate_presence_of(:total_amount_payable) }
  it { should validate_presence_of(:duration) }
end