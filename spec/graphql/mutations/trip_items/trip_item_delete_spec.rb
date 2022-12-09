require 'rails_helper'

RSpec.describe 'TripItemDelete', type: :request do
  describe '.resolve' do
    before :each do
      # let let!(create variable before its called)
      # black box vs clear box testing(industry - black box)
      @trip = Trip.create!(name: 'Disney Trip', category: 'city', id: 1, traveler: 'Mickey',
                           image: 'https://nothanks.com', location: 'California')
      @item = Item.create!(name: 'map', category: 'city', id: 33)
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
      trip_item = TripItem.create!(trip_id: @trip.id, item_id: @item.id)
      expect(TripItem.count).to eq(1)
      post '/graphql', params: { query: @query }
      expect(TripItem.count).to eq(1)
    end

    it 'will return error out if missing information' do
      post '/graphql', params: { query: bad_query }
      json = JSON.parse(response.body)

      expect(json).to include('errors')
      expect(json['errors'].first['message']).to eq('Parse error on "}" (RCURLY) at [2, 44]')
    end

    def bad_query
      <<~GQL
          mutation{
          tripItemDelete(input: {tripId: 1,itemID: })
          {
            tripItem{
              id
            }
          }
        }
      GQL
    end
  end
end
