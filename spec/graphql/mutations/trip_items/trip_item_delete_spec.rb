require 'rails_helper'

RSpec.describe 'TripItemDelete', type: :request do
  describe '.resolve' do
      let (:trip) {Trip.create!(name: 'Disney Trip', category: 'city', id: 1, traveler: 'Mickey',
                           image: 'https://nothanks.com', location: 'California')}

      let(:item) {Item.create!(name: 'map', category: 'city', id: 33)}
    
    it 'response has correct format' do
      trip_item = TripItem.create!(trip_id: trip.id, item_id: item.id)
      response = BeGotbaggageSchema.execute(query).as_json

      expect(response["data"]["tripItemDelete"]["tripItem"]["id"]).to eq(trip_item.id.to_s)
    end
    
    it 'deletes a TripItem' do
      trip_item = TripItem.create!(trip_id: trip.id, item_id: item.id)

      expect(trip.items.count).to eq(1)

      post '/graphql', params: { query: query}
      
      expect(trip.items.count).to eq(0)
    end
    
    it 'will return error out if missing information' do
      post '/graphql', params: { query: bad_query }
      json_response = JSON.parse(response.body)
      
      expect(json_response).to include('errors')
      expect(json_response['errors'].first['message'].include?("Parse error")).to eq(true)
    end

    def query
      <<~GQL
      mutation{
        tripItemDelete(input: {tripId: #{trip.id}, itemId: #{item.id}})
          {
            tripItem{
              id
            }
          }
        }
      GQL
    end

    def bad_query
      <<~GQL
          mutation{
          tripItemDelete(input: {tripId: #{trip.id}, itemID: })
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
