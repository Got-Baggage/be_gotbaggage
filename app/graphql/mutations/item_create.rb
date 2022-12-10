# frozen_string_literal: true

module Mutations
  class ItemCreate < BaseMutation
    description "Creates a new item for a trip"

    field :item, Types::ItemType, null: false

    argument :trip_id, Integer, required: true
    argument :item_name, String, required: true
    argument :category, String, required: false
    
    def resolve(trip_id:, item_name:)
      trip = Trip.find(trip_id)
      item = Item.create!(name: item_name)
      item.trip_items.create!(trip_id: trip.id, item_id: item.id)
      raise GraphQL::ExecutionError.new "Error creating item", extensions: item.errors.to_hash unless item.save
      { item: item }
    end
  end
end
