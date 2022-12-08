require 'rails_helper'

RSpec.describe 'ItemUpdate', type: :request do
  describe '.resolve' do
    before :each do
      @trip = Trip.create!(id: 2, name: 'Disney Trip', category: 'city', traveler: 'Mickey', image: 'whatever.com')
      @item = Item.create!(id: 234, name: 'moouthwash', category: 'city')
      @trip_item = TripItem.create!(trip_id: 2, item_id: 234)
      @query = <<~GQL
        mutation{
          itemUpdate(input: {id: 234, itemName: "mouthwash item"})
          # {
          #   item{
          #     name
          #     id
          #   }
          }
        }
      GQL
    end

    it 'updates an Item' do
      post '/graphql', params: {query: @query}
      # binding.pry
      expect(Trip.count).to eq(1)

      json = JSON.parse(response.body)
      data = json['data']['itemUpdate']['item']

      expect(data[0]['name']).to eq('bossiest item')
    end
  end
end
