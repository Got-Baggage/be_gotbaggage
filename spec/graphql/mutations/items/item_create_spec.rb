require 'rails_helper'

RSpec.describe 'ItemCreate', type: :request do
  describe '.resolve' do
    before :each do
      # @trip = Trip.create!(id: 1, name: 'Disney Trip', category: 'city', traveler: 'Mickey',
      #                      image: 'https://imageofthecity.com')
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

      @result = BeGotbaggageSchema.execute(@query).as_json
    end

    xit 'creates an Item' do
      expect(@result['data']).to be_a(Hash)
      expect(@result['data']['itemCreate']).to be_a(Hash)
      expect(@result['data']['itemCreate']['item']).to be_a(Hash)
      expect(@result['data']['itemCreate']['user']['itemName']).to eq('boss item')
    end
  end
end
