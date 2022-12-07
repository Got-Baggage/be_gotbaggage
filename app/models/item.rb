class Item < ApplicationRecord
  has_many :trip_items
  has_many :trips, through: :trip_items, dependent: :destroy
  validates_presence_of :name, :category
  enum category:[:essentials, :beach, :camping, :international, :city, :snowsports, :roadtrip]
end
