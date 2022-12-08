module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :items_by_category, [Types::ItemType], null: false do
      argument :category, Integer, required: true
    end

    def items_by_category(category:)
      Item.where(category: category)
    end

    field :essential_items, [Types::ItemType], null: false,
      description: "Shows essential items"

    def essential_items
      Item.where(category: "essentials")
    end

    field :category_names, [String], null: false,
      description: "Returns all category names"
        
    def category_names
      Trip.categories.keys
    end

    field :all_trips, [Types::TripType], null: false,
      description: "Returns all trip object"

    def all_trips
      Trip.all
    end

    field :items_by_trip, [Types::ItemType], null: false do
      argument :trip_id, Integer, required: true
    end

    def items_by_trip(trip_id:)
      trip = Trip.find_by(id: trip_id)
      trip.items
    end
  end
end
