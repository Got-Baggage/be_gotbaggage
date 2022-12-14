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
    
    it 'the created trips category attribute is set to the category arg' do
      activity_categories = Trip.categories.keys.drop(1)
      activity_categories.each do |category|
        result = BeGotbaggageSchema.execute(query(category)).as_json
        trip = Trip.last
        expect(trip.category).to eq(category)
      end
    end

    it 'image_selector - sets trips image attribute to the correct image, depending on the category arg' do
      BeGotbaggageSchema.execute(query("beach")).as_json
      expect(Trip.last.image).to eq("https://www.sandals.com/blog/content/images/2020/03/Sandals-Barbados-Beach-Palm-Trees-Beach.jpg")

      BeGotbaggageSchema.execute(query("camping")).as_json
      expect(Trip.last.image).to eq("https://s.yimg.com/ny/api/res/1.2/kVLRa0dKvjn2jE11kUOJxg--/YXBwaWQ9aGlnaGxhbmRlcjt3PTY0MDtoPTQ2OQ--/https://media.zenfs.com/en/galvanized/03890eb402d901af3fc0d8d7a3e64b35")
      
      BeGotbaggageSchema.execute(query("city")).as_json
      expect(Trip.last.image).to eq("https://media.cntraveler.com/photos/5d090bc1244f6a7ae3031eb3/4:3/w_3556,h_2667,c_limit/Chicago_GettyImages-1065188752.jpg")
      
      BeGotbaggageSchema.execute(query("international")).as_json
      expect(Trip.last.image).to eq("https://www.lonestar.edu/images/internationalTravel.jpg")
      
      BeGotbaggageSchema.execute(query("snowsports")).as_json
      expect(Trip.last.image).to eq("https://hips.hearstapps.com/clv.h-cdn.co/assets/16/49/gettyimages-492392636-1.jpg")

      BeGotbaggageSchema.execute(query("roadtrip")).as_json
      expect(Trip.last.image).to eq("https://10-raisons.fr/wp-content/uploads/2021/03/roadtrip-une-aventure-fabuleuse-et-inoubliable.jpg")
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
