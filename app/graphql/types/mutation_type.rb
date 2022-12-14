module Types
  class MutationType < Types::BaseObject
    field :trip_delete, mutation: Mutations::TripDelete
    field :trip_item_delete, mutation: Mutations::TripItemDelete
    field :item_create, mutation: Mutations::ItemCreate
    field :add_item_to_trip, mutation: Mutations::AddItemToTrip
    field :item_update, mutation: Mutations::ItemUpdate
    field :trip_create, mutation: Mutations::TripCreate

    field :clear_trips, [Types::TripType], null: false
    def clear_trips
      trip = Trip.destroy_all
    end
  end
end
