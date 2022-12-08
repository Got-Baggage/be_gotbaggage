require 'rails_helper'

RSpec.describe 'TripCreate', type: :request do
  describe '.resolve' do
    before :each do
      @query = <<~GQL
        mutation  {
          tripCreate(input: {
            name: “Baggage Trip”,
            category: "beach",
            traveler: "Trip"
            }
          ){
            trip {
              name
              category
              traveler
              image
            }
          }
        }
      GQL
    end

    xit 'creates an Event' do
      post '/graphql', params: { query: @query }
      json = JSON.parse(response.body)
      expect(Trip.count).to eq(1)
      data = json['data']['tripCreate']['trip']
      expect(data['name']).to eq('Baggage Trip')
      expect(data['category']).to eq('beach')
      expect(data['traveler']).to eq('Trip')
    end
  end
end
