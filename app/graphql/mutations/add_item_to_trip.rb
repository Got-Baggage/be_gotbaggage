module Mutations
  class AddItemToTrip < BaseMutation
    description "Associates Item with Trip"
    field :trip, Types::TripType, null: false
    field :items, [Types::ItemType], null: false

    argument :trip_id, ID, required: true
    argument :item_ids, [ID], required: true

    def resolve(trip_id:, item_ids:)
      trip = Trip.find(trip_id)
      item_ids.each do |item_id|
        item = Item.find(item_id)
        trip.items << item
      end
      {trip: trip}
    end
  end
end
