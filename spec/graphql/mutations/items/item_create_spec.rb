require 'rails_helper'

RSpec.describe 'ItemCreate', type: :request do
  describe '.resolve' do
    before :each do
      @trip = Trip.create!(id: 1, name: 'Disney Trip', category: 'city', traveler: 'Mickey',
                           image: 'https://imageofthecity.com')
      @query = <<~GQL
        mutation{
          itemCreate(input: {tripId: 1, itemName: “boss item”})
          {
            item{
              name
            }
          }
        }
      GQL
    end

    xit 'creates an Item' do
      expect(Item.count).to eq(0)
      post '/graphql', params: { query: @query }
      expect(Item.count).to eq(1)
    end

    xit 'returns an Item' do
      post '/graphql', params: { query: @query }
      json = JSON.parse(response.body)
      data = json['data']['itemCreate']['item']

      expect(data[0]['name']).to eq('boss item')
    end
  end
end
