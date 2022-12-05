module Types
  class MutationType < Types::BaseObject
    field :item_create, mutation: Mutations::ItemCreate
    field :add_item_to_trip, mutation: Mutations::AddItemToTrip
    field :item_update, mutation: Mutations::ItemUpdate
    field :trip_create, mutation: Mutations::TripCreate
  end
end
