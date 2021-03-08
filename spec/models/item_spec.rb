require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '出品登録' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '出品登録がうまくいくとき' do
      it "product_name, discription, category_id, status_id, price, shipping_id, shipment_source_id, date_of_shipment_id, imageが存在すれば登録できる" do
        expect(@item).to be_valid
      end
      it "priceが¥300~¥9,999,999の間であるとき" do
        @price = 1000
        expect(@item).to be_valid
      end
    end
    context '出品登録がうまくいかないとき' do
      it "nameが空だと登録できない" do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      it "textが空だと登録できない" do
        @item.discription = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Discription can't be blank")
      end
      it "category_idが0以下だと登録できない" do
        @item.category_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 0")
      end
      it "status_idが0以下だと登録できない" do
        @item.status_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 0")
      end
      it "priceが空だと登録できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが¥300未満だと登録できない" do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "priceが¥9,999,999以上だと登録できない" do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it "priceが半角数字ではないと登録できない" do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "shipping_fee_idが0以下だと登録できない" do
        @item.shipping_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping must be other than 0")
      end
      it "prefecture_idが0以下だと登録できない" do
        @item.shipment_source_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment source must be other than 0")
      end
      it "scheduled_delivery_idが0以下だと登録できない" do
        @item.date_of_shipment_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Date of shipment must be other than 0")
      end
      it "imageが空だと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
  
end