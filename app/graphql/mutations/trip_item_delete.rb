module Mutations
  class TripItemDelete < BaseMutation
    description "Deletes an item by ID"

    field :trip_item, Types::TripItemType, null: false

    argument :trip_id, Integer, required: true
    argument :item_id, Integer, required: true

    def resolve(trip_id:, item_id:)
      trip_items = TripItem.where('trip_id = ?', trip_id)
      item = trip_items.where('item_id = ?', item_id).first
      # binding.pry
      item.delete
      { trip_item: item }
    end
  end
end