# frozen_string_literal: true

module Mutations
  class ItemUpdate < BaseMutation
    description "Updates a item by id"

    field :item, Types::ItemType, null: false

    argument :id, ID, required: true
    argument :name, String, required: true

    def resolve(id:, name:)
      item = ::Item.find(id)
      # binding.pry
      item.update(name: name)
      raise GraphQL::ExecutionError.new "Error updating item", extensions: item.errors.to_hash unless item.update(name: name)
      { item: item }
    end
  end
end
