require 'rails_helper'
require 'rake'

RSpec.describe 'TripCreate', type: :request do
  describe '.resolve' do
    it 'returns correctly formatted response' do
      post '/graphql', params: { query: query("beach") }
      json_response = JSON.parse(response.body)
      data = json_response['data']['tripCreate']['trip']

      expect(data['name']).to eq('Baggage Trip')
      expect(data['category']).to eq('beach')
      expect(data['traveler']).to eq('Trip')
    end

    it 'creates a trip in the db' do
      post '/graphql', params: { query: query("beach") }
      trip = Trip.first
      expect(Trip.first.name).to eq('Baggage Trip')
      expect(Trip.first.category).to eq('beach')
    end
    
    it 'a created trip has both essential items and items for the category argument associated with it' do
      load File.expand_path("lib/tasks/load.rake")
      Rake::Task.define_task(:environment)
      Rake::Task["load:all_items"].invoke
      post '/graphql', params: { query: query("beach") }
      trip = Trip.first
      beach_items = Item.where(category: "beach")
      essential_items = Item.where(category: "essentials")

      beach_items.each do |beach_item|
        expect(beach_item.trips.include?(trip)).to eq(true)
      end

      essential_items.each do |essential_item|
        expect(essential_item.trips.include?(trip)).to eq(true)
      end
    end
    
    it 'image_selector method sets the trip image attribute to the correct image string' do
      activity_categories = Trip.categories.keys.drop(1)
      activity_categories.each do |category|
        result = BeGotbaggageSchema.execute(query(category)).as_json
        trip = Trip.last
        expect(trip.category).to eq(category)
      end
    end

    it 'edge case - will return error out if missing information' do
      post '/graphql', params: { query: bad_query }
      json_response = JSON.parse(response.body)
      
      expect(json_response).to include('errors')
      expect(json_response['errors'].first['message'].include?("Parse error")).to eq(true)
    end

    def query(category_input)
      <<~GQL
      mutation  {
        tripCreate(input: {
          name: "Baggage Trip",
          category: "#{category_input}",
          traveler: "Trip"
        }
        ){
          trip {
            name
            category
            traveler
            image
          }
        }
      }
      GQL
    end
    
    def bad_query
      <<~GQL
      mutation  {
        tripCreate(input: {
          name: ,
          category: "beach",
          traveler: "Trip"
        }
        ){
          trip {
            name
            category
            traveler
            image
          }
        }
      }
      GQL
    end
  end  
end
