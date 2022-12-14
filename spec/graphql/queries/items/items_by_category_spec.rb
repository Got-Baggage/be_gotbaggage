require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'items_by_category' do
    it 'can find items by a given category' do
      item1 = Item.create!(name: 'Toothbrush', category: 1)
      item2 = Item.create!(name: 'Shirt', category: 2)
      item3 = Item.create!(name: 'Socks', category: 2)

      result = BeGotbaggageSchema.execute(query).as_json

      expect(result['data']['itemsByCategory'].count).to eq(2)
      result['data']['itemsByCategory'].each do |item|
        expect(item).to have_key('name')
      end
      items = result['data']['itemsByCategory']
      expect(items.first['name']).to eq('Shirt')
      expect(items.second['name']).to eq('Socks')
    end
  end

  def query
    <<~GQL
      query{
        itemsByCategory(category: 2)
        {
          name
        }
      }
    GQL
  end
end
