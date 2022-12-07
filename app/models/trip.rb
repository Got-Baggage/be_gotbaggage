class Trip < ApplicationRecord
  has_many :trip_items
  has_many :items, through: :trip_items, dependent: :destroy
  validates_presence_of :name, :traveler, :category, :image, :location
  enum category:[:essentials, :beach, :camping, :international, :city, :snowsports, :roadtrip]
end
