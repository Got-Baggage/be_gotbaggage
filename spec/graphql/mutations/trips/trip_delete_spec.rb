require 'rails_helper'

RSpec.describe 'TripDelete', type: :request do
  describe '.resolve' do
    before :each do
      @trip = Trip.create!(name: "Disney Trip", category: "city", id: 1, traveler: "Mickey", image: "https://nothanks.com", location: "California")
      @query = <<~GQL
        mutation {tripDelete(input: {id:1})
          {
          trip{
            id
            }
          }
        }
      GQL
    end

    it 'deletes an Event' do
      expect(Trip.count).to eq(1)
      post '/graphql', params: { query: @query }
      expect(Trip.count).to eq(0)
    end
  end
end
