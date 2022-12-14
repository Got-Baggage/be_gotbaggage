require 'rails_helper'

RSpec.describe 'ItemUpdate', type: :request do
  describe '.resolve' do
    before :each do
      @trip = Trip.create!(id: 2, name: 'Disney Trip', category: 'city', traveler: 'Mickey', image: 'whatever.com')
      @item = Item.create!(id: 234, name: 'moouthwash')
      @trip_item = TripItem.create!(trip_id: 2, item_id: 234)
    end
    
    it 'returns correct response' do
      post '/graphql', params: { query: query }
      json = JSON.parse(response.body)
      data = json['data']['itemUpdate']['item']
      
      expect(data['name']).to eq('mouthwash item')
    end
    
    it 'updates item name in db' do
      post '/graphql', params: { query: query }

      expect(@item.reload.name).to eq('mouthwash item')
    end

    it 'will return error out if missing information' do
      post '/graphql', params: { query: bad_query }
      json = JSON.parse(response.body)
      
      expect(json).to include('errors')
      expect(json['errors'].first['message']).to eq("Argument 'name' on InputObject 'ItemUpdateInput' is required. Expected type String!")
    end

    def query
      <<~GQL
      mutation{
          itemUpdate(input: {id: #{@item.id}, name: "mouthwash item"})
        {
        item{
              name
              id
          }
        }
      }
      GQL
    end

    def bad_query
      <<~GQL
          mutation{
          itemUpdate(input: {id: 234})
          {
            item{
              name
              id
            }
          }
        }
      GQL
    end
  end
end
