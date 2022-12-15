# frozen_string_literal: true

module Types
  class TripItemType < Types::BaseObject
    field :id, ID, null: false
    field :trip_id, Integer
    field :item_id, Integer
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
