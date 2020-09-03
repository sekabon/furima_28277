require 'rails_helper'

RSpec.describe ItemPurchase, type: :model do
  describe '商品購入' do
    before do
      @item_purchase = FactoryBot.build(:item_purchase)
    end
    it 'クレジットカードの情報が空だと購入できないこと' do
      @item_purchase.token = nil
      @item_purchase.valid?
      expect(@item_purchase.errors.full_messages).to include("Token can't be blank")
    end
    it '郵便番号にハイフンを含んだ正しい形式でないと購入できないこと' do
      @item_purchase.postal_code = '1234567'
      @item_purchase.valid?
      expect(@item_purchase.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end
    it '都道府県を選択していないと購入できないこと' do
      @item_purchase.prefecture_id = '---'
      @item_purchase.valid?
      expect(@item_purchase.errors.full_messages).to include('Prefecture Select')
    end
    it '市区町村が空だと購入できないこと' do
      @item_purchase.city = ''
      @item_purchase.valid?
      expect(@item_purchase.errors.full_messages).to include("City can't be blank")
    end
    it '番地が空だと購入できないこと' do
      @item_purchase.house_number = ''
      @item_purchase.valid?
      expect(@item_purchase.errors.full_messages).to include("House number can't be blank")
    end
    it '建物名は空でも購入できること' do
      @item_purchase.building_name = nil
      expect(@item_purchase).to be_valid
    end
    it '電話番号はハイフンは不要で11桁以内であれば購入できること' do
      @item_purchase.phone_number = '09012345678'
      expect(@item_purchase).to be_valid
    end
    it '電話番号は12桁以上だと購入できないこと' do
      @item_purchase.phone_number = '090123456789'
      @item_purchase.valid?
      expect(@item_purchase.errors.full_messages).to include('Phone number is invalid')
    end
  end
end
