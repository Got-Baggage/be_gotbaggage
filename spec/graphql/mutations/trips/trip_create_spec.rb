require 'rails_helper'

RSpec.describe 'TripCreate', type: :request do
  describe '.resolve' do
    before :each do
      @query = <<~GQL
        mutation {
          tripCreate(input: {name: “Baggage Trip”, category: 3})
          {
            trip {
              name
              category
              image
            }
          }
        }
      GQL
    end

    it 'creates an Event' do
      expect(Trip.count).to eq(0)
      post '/graphql', params: { query: @query }
      expect(Trip.count).to eq(1)
    end

    it 'returns an Event' do
      post '/graphql', params: { query: @query }
      json = JSON.parse(response.body)
      data = json['data']['tripCreate']['trip']

      expect(data[0]['name']).to eq('Baggage Trip')
      expect(data[0]['category']).to eq('international')
    end
  end
end
