class Purchase < ApplicationRecord
  validates :price, presence: true
end
