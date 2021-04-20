require 'rails_helper'

RSpec.describe OrderAdress, type: :model do
  describe '購入情報の保存' do
    before do
      @item = FactoryBot.create(:item)
      @user = FactoryBot.create(:user)
      @order_adress = FactoryBot.build(:order_adress, user_id: @user.id, item_id: @item.id)
      sleep 0.1
    end

    context '情報の保存がうまくいく時' do
      it '全ての値が正しく入力されていれば保存できる' do
        expect(@order_adress).to be_valid
      end
      it '建物名が抜けていても登録できる' do
        @order_adress.buildingname = ''
        expect(@order_adress).to be_valid
      end
    end
    context '情報の保存がうまくいかない時' do
      it 'user_idが空だと保存できない' do
        @order_adress.user_id = ''
        expect(@user).to be_valid
      end
      it 'item_idが空だと保存できない' do
        @order_adress.item_id = ''
        expect(@item).to be_valid
      end
      it 'postnumberが空だと保存できない' do
        @order_adress.postnumber = ''
        @order_adress.valid?
        expect(@order_adress.errors.full_messages).to include("Postnumber can't be blank")
      end
      it 'postnumberにハイフンがないと保存できない' do
        @order_adress.postnumber = '1234567'
        @order_adress.valid?
        expect(@order_adress.errors.full_messages).to include("Postnumber Input correctly")
      end
      it 'shipment_sourceが空だと保存できない' do
        @order_adress.shipment_source_id = ''
        @order_adress.valid?
        expect(@order_adress.errors.full_messages).to include("Shipment source can't be blank")
      end
      it 'shipment_sourceが0だと保存できない' do
        @order_adress.shipment_source_id = 0
        @order_adress.valid?
        expect(@order_adress.errors.full_messages).to include("Shipment source can't be blank")
      end
      it 'municipalityが空だと保存できない' do
        @order_adress.municipality = ''
        @order_adress.valid?
        expect(@order_adress.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空だと保存できない' do
        @order_adress.address = ''
        @order_adress.valid?
        expect(@order_adress.errors.full_messages).to include("Address can't be blank")
      end
      it 'phonenumberが空だと保存できない' do
        @order_adress.phonenumber = ''
        @order_adress.valid?
        expect(@order_adress.errors.full_messages).to include("Phonenumber can't be blank")
      end
      it 'phonenumberにハイフンがあると保存できない' do
        @order_adress.phonenumber = '-'
        @order_adress.valid?
        expect(@order_adress.errors.full_messages).to include("Phonenumber Input only number")
      end
      it 'phonenumberが12桁以上だと保存できない' do
        @order_adress.phonenumber = '01234567890123'
        @order_adress.valid?
        expect(@order_adress.errors.full_messages).to include("Phonenumber is too long (maximum is 11 characters)")
      end
      it 'tokenが空では保存できない' do
        @order_adress.token = nil
        @order_adress.valid?
        expect(@order_adress.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
