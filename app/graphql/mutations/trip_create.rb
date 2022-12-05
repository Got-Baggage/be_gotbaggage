# frozen_string_literal: true
module Mutations
  class TripCreate < BaseMutation
    description "Creates a new trip"
    
    argument :name, String, required: true
    argument :category, Integer, required: true

    field :trip, Types::TripType, null: false

    def resolve(name:, category:)
      # trip = ::Trip.new(name: name, category: category)
      trip = Trip.new(name: name, category: category, image: image_selector(category))
      raise GraphQL::ExecutionError.new "Error creating trip", extensions: trip.errors.to_hash unless trip.save
      { trip: trip }
    end

    def image_selector(category)
      "https://www.sandals.com/blog/content/images/2020/03/Sandals-Barbados-Beach-Palm-Trees-Beach.jpg" if category == 2
      "https://s.yimg.com/ny/api/res/1.2/kVLRa0dKvjn2jE11kUOJxg--/YXBwaWQ9aGlnaGxhbmRlcjt[…]/media.zenfs.com/en/galvanized/03890eb402d901af3fc0d8d7a3e64b35" if category == 3
      "https://www.lonestar.edu/images/internationalTravel.jpg" if category == 4
      "https://hips.hearstapps.com/clv.h-cdn.co/assets/16/49/gettyimages-492392636-1.jpg" if category == 5
      "https://10-raisons.fr/wp-content/uploads/2021/03/roadtrip-une-aventure-fabuleuse-et-inoubliable.jpg" if category == 6
    end
  end
end
