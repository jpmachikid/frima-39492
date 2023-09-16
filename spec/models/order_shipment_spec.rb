require 'rails_helper'

RSpec.describe OrderShipment, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_shipment = FactoryBot.build(:order_shipment, user_id: user.id, item_id: item.id )
      sleep(0.5)
    end

    context '内容に問題がない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_shipment).to be_valid
      end
      it 'buildingが空でも保存できること' do
        @order_shipment.building = ''
        expect(@order_shipment).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'tokenが空だと保存出来ない' do
        @order_shipment.token = ''
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと保存出来ない' do
        @order_shipment.postal_code = ''
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが全角数字だと保存出来ない' do
        @order_shipment.postal_code = '１２３ー４５６７'
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Postal code is invalid")
      end
      it 'postal_codeが○○○-○○○○の形式でないと保存出来ない' do
        @order_shipment.postal_code = '1234567'
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Postal code is invalid")
      end
      it 'prefectureを選択していないと保存出来ない' do
        @order_shipment.prefecture_id = ''
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存出来ない' do
        @order_shipment.city = ''
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空だと保存出来ない' do
        @order_shipment.house_number = ''
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("House number can't be blank")
      end
      it 'telephoneが空だと保存出来ない' do
        @order_shipment.telephone = ''
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Telephone can't be blank")
      end
      it 'telephoneが12文字以上の半角数字では保存出来ない' do
        @order_shipment.telephone = '000000000000'
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Telephone is invalid")
      end
      it 'telephoneが9文字以下の半角数字では保存出来ない' do
        @order_shipment.telephone = '000000000'
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Telephone is invalid")
      end
      it 'telephoneが全角数字だと保存出来ない' do
        @order_shipment.telephone = '００００００００００'
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Telephone is invalid")
      end
      it 'userが紐付いていないと保存出来ない' do
        @order_shipment.user_id = nil
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存出来ない' do
        @order_shipment.item_id = nil
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
