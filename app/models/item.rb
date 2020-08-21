class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user

  has_one_attached :image
  
  belongs_to_active_hash :category, :condition, :postage_type, :ship_days, :ship_area
  validates :category_id, :condition, :postage_type, :ship_days, :ship_area, numericality: { other_than: 1 } 

end