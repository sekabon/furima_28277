class ItemPurchase
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :token, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number
  with_options presence: true do
    validates :token
    validates :postal_code
    validates :city
    validates :house_number
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 0, message: 'Select' }
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid.' }
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    DeliveryAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end

