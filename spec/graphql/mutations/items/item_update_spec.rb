require 'rails_helper'

RSpec.describe 'ItemUpdate', type: :request do
  describe '.resolve' do
    before :each do
      @trip = Trip.create!(id: 2, name: 'Disney Trip', category: 'city', traveler: 'Mickey', image: 'whatever.com')
      @item = Item.create!(id: 234, name: 'moouthwash')
      @trip_item = TripItem.create!(trip_id: 2, item_id: 234)
      @query = <<~GQL
        mutation{
          itemUpdate(input: {id: 234, name: "mouthwash item"})
          {
            item{
              name
              id
            }
          }
        }
      GQL
    end

    it 'updates an Item' do
      post '/graphql', params: {query: @query}
      # expect(Trip.count).to eq(1)
      json = JSON.parse(response.body)
      data = json['data']['itemUpdate']['item']      
      expect(data['name']).to eq('mouthwash item')
    end
  end
end
