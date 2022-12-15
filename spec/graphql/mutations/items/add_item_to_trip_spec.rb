require 'rails_helper'

RSpec.describe 'AddItemToTrip', type: :request do
  let(:trip1) {Trip.create!(name: "Stephen's trip", category: "beach", traveler: "Stephen", image: "ssldkfjd.jpg")}
  let(:trip2) {Trip.create!(name: "Roger's trip", category: "international", traveler: "Roger", image: "aaswdfslfd.jpg")}
  let(:item1) {Item.create!(name: "Plant")}
  let(:item2) {Item.create!(name: "Candy")}

  it 'associates an item with a trip' do
    result = BeGotbaggageSchema.execute(query).as_json

    expect(result["data"]["addItemToTrip"]["trip"]["name"]).to eq(trip1.name)
    expect(trip1.items).to eq([item1, item2])
    expect(trip2.items).to eq([])
  end

  it 'edge case - missing arguments return error message' do
    result = BeGotbaggageSchema.execute(bad_query).as_json

    expect(result["errors"].first["message"]).to eq("Argument 'tripId' on InputObject 'AddItemToTripInput' is required. Expected type ID!")
  end

  def query
    <<~GQL
    mutation{
      addItemToTrip(input: {tripId: #{trip1.id}, itemIds: [#{item1.id}, #{item2.id}]}){
        trip{
          name
        }
      }
    }
    GQL
  end

  def bad_query
    <<~GQL
      mutation{
        addItemToTrip(input: {itemIds: [#{item1.id}, #{item2.id}]}){
          trip{
            name
          }
        }
      }
    GQL
  end
end