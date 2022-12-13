require 'rails_helper'

RSpec.describe 'ItemCreate', type: :request do
  describe '.resolve' do
    before :each do
      @trip = Trip.create!(id: 1, name: 'Disney Trip', category: 'city', traveler: 'Mickey',
                           image: 'https://imageofthecity.com')
      @query = <<~GQL
        mutation{
          itemCreate(input: {tripId: 1, itemName: "medicine"})
          {
            item{
              name
            }
          }
        }
      GQL

      @result = BeGotbaggageSchema.execute(@query).as_json
    end

    it 'creates an Item' do
      expect(@result['data']).to be_a(Hash)
      expect(@result['data']['itemCreate']).to be_a(Hash)
      expect(@result['data']['itemCreate']['item']).to be_a(Hash)
      expect(@result['data']['itemCreate']['item']['name']).to eq('medicine')
    end

    it 'will return error out if missing information' do
      post '/graphql', params: { query: bad_query }
      json = JSON.parse(response.body)

      expect(json).to include('errors')
      expect(json['errors'].first['message']).to eq("Argument 'itemName' on InputObject 'ItemCreateInput' is required. Expected type String!")
    end

    def bad_query
      <<~GQL
          mutation{
          itemCreate(input: {tripId: 1, category: 1})
          {
            item{
              name
            }
          }
        }
      GQL
    end
  end
end
