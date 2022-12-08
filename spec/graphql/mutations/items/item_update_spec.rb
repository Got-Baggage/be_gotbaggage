require 'rails_helper'

RSpec.describe 'ItemUpdate', type: :request do
  describe '.resolve' do
    before :each do
      @query = <<~GQL
        mutation{
          itemUpdate(input: {id: 1, itemName: “bossiest item”})
          {
            item{
              name
            }
          }
        }
      GQL
    end

    xit 'updates an Item' do
      post '/graphql', params: {query: @query}
      expect(Trip.count).to eq(1)

      json = JSON.parse(response.body)
      data = json['data']['itemUpdate']['item']

      expect(data[0]['name']).to eq('bossiest item')
    end
  end
end
