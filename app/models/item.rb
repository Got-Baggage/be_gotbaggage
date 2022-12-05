class Item < ApplicationRecord
  has_many :trips, through: :trip_items, optional: true
  validates_presence_of :name
  enum category:[:essentials, :beach, :camping, :international, :city, :snowsports, :roadtrip]
end
