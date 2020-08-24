require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/test_image.png')
  end

  describe '商品出品' do
    context '商品出品できる場合' do
      it "商品名,説明文,カテゴリー,商品の状態,配送料の負担,発送元地域,発送までの日数,価格の情報があれば出品できる" do
        expect(@item).to be_valid
      end
      it "画像が1枚あれば出品できる" do
        expect(@item.image).to be_valid
      end  
    end
    context '商品出品できない場合' do
      it "画像は1枚なければ出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名がなければ出品できない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "商品の説明がなければ出品できない" do
        @item.introduction = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduction can't be blank")
      end
      it "カテゴリーの情報がなければ出品できない" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "商品の状態についての情報がなければ出品できない" do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "配送料の負担についての情報がなければ出品できない" do
        @item.postage_type_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage type can't be blank")
      end
      it "発送元の地域についての情報がなければ出品できない" do
        @item.ship_area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship area can't be blank")
      end
      it "発送までの日数についての情報がなければ出品できない" do
        @item.ship_days_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship days can't be blank")
      end
      it "価格についての情報がなければ出品できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end 
      it "価格が、¥300未満では出品できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it "価格が、¥10000000以上では出品できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
    end
  end
end

