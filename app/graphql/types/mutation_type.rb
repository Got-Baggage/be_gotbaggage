module Types
  class MutationType < Types::BaseObject
    field :item_create, Types::ItemType, null: false do
      argument :name, String, required: true
    end

    def item_create(name:)
      Item.create(name: name)
    end
    
    field :item_update, Types::ItemType, null: false do
      argument :id, ID, required: true
      argument :new_name, String, required: true
    end

    def item_update(id:, new_name:)
      item = Item.find(id)
      item.update(name: new_name)
    end
  end
end
