# frozen_string_literal: true
module Mutations
  class TripCreate < BaseMutation
    description "Creates a new trip"
    
    argument :name, String, required: true
    argument :category, String, required: true
    argument :traveler, String, required: true
    
    field :trip, Types::TripType, null: false

    def resolve(name:, category:, traveler:)
      # trip = ::Trip.new(name: name, category: category)
      trip = Trip.new(name: name, category: category, traveler: traveler, image: image_selector(category))
      raise GraphQL::ExecutionError.new "Error creating trip", extensions: trip.errors.to_hash unless trip.save
      { trip: trip }
    end

    def image_selector(category)
      "https://www.sandals.com/blog/content/images/2020/03/Sandals-Barbados-Beach-Palm-Trees-Beach.jpg" if category == 2
      "https://www.lonestar.edu/images/internationalTravel.jpg" if category == 4
    end
  end
end
