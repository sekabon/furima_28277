class Item < ApplicationRecord
  belongs_to :user
  with_options presence:true do 
    validates :name
    validates :image
    validates :introduction
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"} 
  end
  has_one_attached :image
extend ActiveHash::Associations::ActiveRecordExtensions
  #belongs_to_active_hash :item_detail
  with_options presence:true do 
    validates :category_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :condition_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :postage_type_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :ship_area_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :ship_days_id, numericality: { other_than: 0, message: "can't be blank" }
  end
  
  
 
end

