require 'rails_helper'

RSpec.describe Trip, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:traveler) }
    it { should validate_presence_of(:category) }
    it { should validate_presence_of(:image) }
  end

  describe 'relationships' do
    it { should have_many :trip_items }
    it { should have_many(:items).through(:trip_items) }
  end
end
