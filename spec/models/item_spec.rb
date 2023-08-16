require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品を出品できる場合' do
      it 'item_name,description,category_id,condition_id,shipping_fee_id,prefecture_id,shipping_date_id,priceが存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品を出品できない場合' do
      it 'item_nameが空では保存できない' do
        @item.item_name =''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'descriptionが空では保存できない' do
        @item.description =''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'Category_idが空では保存できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'condition_idが空では保存できない' do
        @item.condition_id =''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'shipping_fee_idが空では保存できない' do
        @item.shipping_fee_id =''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
      end
      it 'prefecture_idが空では保存できない' do
        @item.prefecture_id =''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'shipping_date_idが空では保存できない' do
        @item.shipping_date_id =''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date can't be blank")
      end
      it 'priceが空では保存できない' do
        @item.price =''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'imageが空では保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'user_idが紐づいていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
      it 'priceが全角では保存できない' do
        @item.price ='５０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'priceが300より小さい値では保存できない' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 299")
      end
      it 'priceが9999999より大きい値では保存できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 10000000")
      end
    end
  end

end
