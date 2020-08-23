class Item < ApplicationRecord
  belongs_to :user
  
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  #belongs_to_active_hash (:category, :condition, :postage_type, :ship_days, :ship_area)
end

