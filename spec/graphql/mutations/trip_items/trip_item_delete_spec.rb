require 'rails_helper'

RSpec.describe 'TripItemDelete', type: :request do
  describe '.resolve' do
    before :each do
      @trip = Trip.create!{name: "Disney Trip", category: "city", trip_id: 1}
      @item = Item.create!{name: "map", category: "city", item_id: 33}
      @query = <<~GQL
        mutation{
          tripItemDelete(input: {tripId: 1,itemID: 33})
          {
            tripItem{
              id
            }
          }
        }
      GQL
    end

    it 'deletes a TripItem' do
      trip_item = TripItem.create!{trip_id: @trip.trip_id, item_id: @item.trip_id}
      expect(TripItem.count).to eq(1)
      post '/graphql', params: { query: @query }
      expect(TripItem.count).to eq(1)
    end
  end
end
