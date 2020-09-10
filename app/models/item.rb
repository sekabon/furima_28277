class Item < ApplicationRecord
  belongs_to :user
  has_one    :purchase

  has_one_attached :image
  with_options presence: true do
    validates :name
    validates :image
    validates :introduction
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'が設定範囲外です' }
  end
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage_type
  belongs_to_active_hash :ship_area
  belongs_to_active_hash :ship_days
  with_options presence: true do
    validates :category_id#, numericality: { other_than: 0, message: "can't be blank" }
    validates :condition_id#, numericality: { other_than: 0, message: "can't be blank" }
    validates :postage_type_id#, numericality: { other_than: 0, message: "can't be blank" }
    validates :ship_area_id#, numericality: { other_than: 0, message: "can't be blank" }
    validates :ship_days_id#, numericality: { other_than: 0, message: "can't be blank" }
  end
end
