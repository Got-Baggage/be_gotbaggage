# frozen_string_literal: true

module Types
  class TripType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :category, String
    field :traveler, String
    field :trip_items, [Types::ItemType]
    field :image, String
    field :group_id, Integer
    field :start_date, GraphQL::Types::ISO8601DateTime
    field :end_date, GraphQL::Types::ISO8601DateTime
    field :location, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    def trip_items
      object.items
    end
  end
end
