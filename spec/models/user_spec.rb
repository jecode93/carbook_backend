require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid' do
    user = User.new(username: 'user1')
    expect(user).to be_valid
  end

  it 'is not valid without an username' do
    user = User.new()
    expect(user).to_not be_valid
    expect(user.errors[:username]).to include("can't be blank")
  end

  it 'uniqueness of username' do
    User.create(username: 'existinguser')
    user = User.new(username: 'existinguser')
    expect(user).to_not be_valid
    expect(user.errors[:username]).to include('has already been taken')
  end
end