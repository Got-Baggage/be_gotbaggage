require 'rails_helper'

RSpec.describe 'TripDelete', type: :request do
  describe '.resolve' do
    before :each do
      @trip = Trip.create!(name: 'Disney Trip', category: 'city', id: 1, traveler: 'Mickey',
                           image: 'https://nothanks.com', location: 'California')
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

    it 'deletes a Trip' do
      expect(Trip.count).to eq(1)
      post '/graphql', params: { query: @query }
      expect(Trip.count).to eq(0)
    end

    it 'will return error out if missing information' do
      post '/graphql', params: { query: bad_query }
      json = JSON.parse(response.body)

      expect(json).to include('errors')
      expect(json['errors'].first['message']).to eq('Parse error on "}" (RCURLY) at [1, 36]')
    end

    def bad_query
      <<~GQL
          mutation {tripDelete(input: {id: })
          {
          trip{
            id
            }
          }
        }
      GQL
    end
  end
end
