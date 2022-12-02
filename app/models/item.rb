class Item < ApplicationRecord
  belongs_to :trip, optional: true
end
