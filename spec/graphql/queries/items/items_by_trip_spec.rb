require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'items_by_trip' do
    before :each do
      @item1 = Item.create!(name: 'Toothbrush', category: 1, id: 1)
      @item2 = Item.create!(name: 'Shirt', category: 2, id: 2)
      @item3 = Item.create!(name: 'Socks', category: 2, id: 3)
      @trip = Trip.create!(name: 'Disney Trip', category: 'city', id: 1, traveler: 'Mickey',
                           image: 'https://nothanks.com', location: 'California')
      @trip_item1 = TripItem.create!(trip_id: @trip.id, item_id: @item2.id)
      @trip_item = TripItem.create!(trip_id: @trip.id, item_id: @item3.id)

      @query = <<~GQL
        query
          {
            itemsByTrip(tripId:1){
              name
              id
            }
          }
      GQL
    end

    it 'returns all items by trip' do
      result = BeGotbaggageSchema.execute(@query).as_json

      expect(result['data']['itemsByTrip'].count).to eq(2)
      expect(result['data']['itemsByTrip'][0]['name']).to eq('Shirt')
      expect(result['data']['itemsByTrip'][1]['name']).to eq('Socks')
      expect(result['data']['itemsByTrip'][1]['name']).to_not eq('Toothbrush')

      expect(result['data']['itemsByTrip'][0]).to have_key('name')
      expect(result['data']['itemsByTrip'][0]).to have_key('id')
    end
  end
end
