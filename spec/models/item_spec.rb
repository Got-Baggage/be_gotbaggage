require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :category }
  end

  describe 'relationships' do
    it { should have_many :trip_items }
    it { should have_many(:trips).through(:trip_items) }
  end
end
