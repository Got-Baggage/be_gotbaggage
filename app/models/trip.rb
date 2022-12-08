class Trip < ApplicationRecord
  has_many :trip_items, dependent: :destroy
  has_many :items, through: :trip_items, dependent: :destroy
  validates_presence_of :name, :category, :traveler, :image
  enum category:[:essentials, :beach, :camping, :international, :city, :snowsports, :roadtrip]
end
