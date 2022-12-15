# frozen_string_literal: true
module Mutations
  class TripCreate < BaseMutation
    description "Creates a new trip"
    
    argument :name, String, required: true
    argument :category, String, required: true
    argument :traveler, String, required: true
    
    field :trip, Types::TripType, null: false

    def resolve(name:, category:, traveler:)
      trip = Trip.create!(name: name, category: category, traveler: traveler, image: image_selector(category))
      trips_items = Item.where(category: category) + Item.where(category: 'essentials') 
      trips_items.each do |item|
        item.trip_items.create!(trip_id: trip.id, item_id: item.id)
      end
      raise GraphQL::ExecutionError.new "Error creating trip", extensions: trip.errors.to_hash unless trip.save
      { trip: trip }
    end
  

    def image_selector(category)
      return "https://www.sandals.com/blog/content/images/2020/03/Sandals-Barbados-Beach-Palm-Trees-Beach.jpg" if category == "beach"
      return "https://s.yimg.com/ny/api/res/1.2/kVLRa0dKvjn2jE11kUOJxg--/YXBwaWQ9aGlnaGxhbmRlcjt3PTY0MDtoPTQ2OQ--/https://media.zenfs.com/en/galvanized/03890eb402d901af3fc0d8d7a3e64b35" if category == "camping"
      return "https://media.cntraveler.com/photos/5d090bc1244f6a7ae3031eb3/4:3/w_3556,h_2667,c_limit/Chicago_GettyImages-1065188752.jpg" if category == "city"
      return "https://www.lonestar.edu/images/internationalTravel.jpg" if category == "international"
      return "https://hips.hearstapps.com/clv.h-cdn.co/assets/16/49/gettyimages-492392636-1.jpg" if category == "snowsports"
      return "https://10-raisons.fr/wp-content/uploads/2021/03/roadtrip-une-aventure-fabuleuse-et-inoubliable.jpg" if category == "roadtrip"
    end
  end
end
