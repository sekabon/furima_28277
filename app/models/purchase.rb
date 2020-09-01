class Purchase < ApplicationRecord
  # validates :price, presence: true
  belongs_to :user
  belongs_to :item
  has_one    :delivery_address
end
