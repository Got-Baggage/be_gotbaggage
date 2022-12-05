module Mutations
  class ItemsDelete < BaseMutation
    description "Deletes an item by ID"

    field :item, Types::ItemType, null: false

    argument :trip_id, Integer, required: true
    argument :item_id, Integer, required: true

    def resolve(trip_id:, item_id:)
      item = Item.find(trip_id)
      item.delete
    end
  end
end