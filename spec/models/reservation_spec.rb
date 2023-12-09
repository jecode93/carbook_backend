require 'rails_helper'

RSpec.describe Reservation, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:bike) }
  end

  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:date) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:bike_id) }
end