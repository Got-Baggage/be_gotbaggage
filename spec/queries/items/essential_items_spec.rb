require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'essential_items' do
    it 'returns items for the essentials category' do
      item1 = Item.create!(name: "Toothbrush", category: 1)
      item2 = Item.create!(name: "Shirt", category: 0)
      item3 = Item.create!(name: "Socks", category: 0)

      result = BeGotbaggageSchema.execute(query).as_json

      expect(result["data"]["essentialItems"].count).to eq(2)
      result["data"]["essentialItems"].each do |item|
        expect(item).to have_key("name")
      end
      items = result["data"]["essentialItems"]
      expect(items.first["name"]).to eq("Shirt")
      expect(items.second["name"]).to eq("Socks")
    end
  end

  def query
    <<~GQL
      query{
        essentialItems{
          name
        }
      }
    GQL
  end
end