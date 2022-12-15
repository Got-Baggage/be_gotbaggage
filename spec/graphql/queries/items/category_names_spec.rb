require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'category_names' do
    it 'returns all unique Trip categories' do
      result = BeGotbaggageSchema.execute(query).as_json

      expect(result['data']['categoryNames']).to be_an(Array)
      result['data']['categoryNames'].each do |category|
        expect(category).to be_a(String)
      end
    end
  end

  def query
    <<~GQL
      query {
        categoryNames
      }
    GQL
  end
end
