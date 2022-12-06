class Trip < ApplicationRecord
  has_many :items, through: :trip_items, dependent: :destroy
  validates_presence_of :name, :category
  enum category:[:essentials, :beach, :camping, :international, :city, :snowsports, :roadtrip]
end
