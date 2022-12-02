class Trip < ApplicationRecord
  has_many :items
  validates_presence_of :name, :category
  enum category:[:essentials, :beach, :camping, :international, :city, :snow_sports, :roadtrip]
end
