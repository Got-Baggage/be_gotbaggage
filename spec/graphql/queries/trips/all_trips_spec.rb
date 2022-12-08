require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'all_trips' do
    before :each do
      @trip1 = Trip.create!(id: 1, name: 'Disney Trip', category: 'city', traveler: 'Mickey',
                           image: 'https://nothanks.com', location: 'California')
      @trip2 = Trip.create!(id: 2, name: 'Beach Trip', category: 'beach', traveler: 'Minnie',
                           image: 'https://yesplease.com', location: 'California')
      @trip3 = Trip.create!(id: 3, name: 'The Bean', category: 'city', traveler: 'Mickey',
                           image: 'https://illpass.com', location: 'Chicago')
      @query = <<~GQL
                query
                  {
                    allTrips{
                      name
                      category
                    }
                  }
              GQL
    end

    it 'returns all trips' do
      result = BeGotbaggageSchema.execute(@query).as_json

      expect(result['data']['allTrips'].count).to eq(3)
      expect(result['data']['allTrips'][0]['name']).to eq('Disney Trip')
      expect(result['data']['allTrips'][1]['name']).to eq('Beach Trip')
      expect(result['data']['allTrips'][2]['name']).to eq('The Bean')
      expect(result['data']['allTrips'][2]['name']).to_not eq('Running away to the forest')

      expect(result['data']['allTrips'][0]).to have_key('name')
      expect(result['data']['allTrips'][0]).to have_key('category')
    end
  end
end
