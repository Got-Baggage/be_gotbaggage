require 'rails_helper'

RSpec.describe 'AddItemToTrip', type: :request do
  it 'associates an item with a trip' do
    @trip1 = Trip.create!(name: "Stephen's trip", category: "beach", traveler: "Stephen", image: "ssldkfjd.jpg")
    @trip2 = Trip.create!(name: "Roger's trip", category: "international", traveler: "Roger", image: "aaswdfslfd.jpg")
    @item1 = Item.create!(name: "Plant")
    @item2 = Item.create!(name: "Candy")
    result = BeGotbaggageSchema.execute(mutation).as_json

    expect(result["data"]["addItemToTrip"]["trip"]["name"]).to eq(@trip1.name)
    expect(@trip1.items).to eq([@item1, @item2])
    expect(@trip2.items).to eq([])
  end

  def mutation
    <<~GQL
    mutation{
      addItemToTrip(input: {tripId: #{@trip1.id}, itemIds: [#{@item1.id}, #{@item2.id}]}){
        trip{
          name
        }
      }
    }
    GQL
  end

end