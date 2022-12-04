class Item < ApplicationRecord
  belongs_to :trip, optional: true
  validates_presence_of :name
  enum category:[:essentials, :beach, :camping, :international, :city, :snowsports, :roadtrip]
end
