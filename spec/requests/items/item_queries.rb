require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'items_by_category' do
    it 'can find items by a given category' do
      item1 = Item.create!(name: "Toothbrush", category: 1)
      item2 = Item.create!(name: "Shirt", category: 2)
      item3 = Item.create!(name: "Socks", category: 2)

      result = BeGotbaggageSchema.execute(query).as_json

      def query
        <<~GQL

        
        GQL
      end
    end
  end

end