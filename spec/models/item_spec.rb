require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品ができる場合' do
      it '全ての入力項目が存在すれば出品できる' do
        expect(@item).to be_valid
      end

      it '価格が¥300~¥9,999,999の間であれば出品できる' do
        @item.price = '10000'
        expect(@item).to be_valid
      end

      it '価格入力が半角数値であれば出品できる' do
        @item.price = '1000'
        expect(@item).to be_valid
      end
    end

    context '商品出品ができない場合' do
      it 'item_nameが空では出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it 'textが空では出品できない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end

      it 'categoryが未選択では出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'item_stateが未選択では出品できない' do
        @item.item_state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item state can't be blank")
      end

      it 'shipping_cost_bearerが未選択では出品できない' do
        @item.shipping_cost_bearer_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost bearer can't be blank")
      end

      it 'prefecturesが未選択では出品できない' do
        @item.prefectures_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefectures can't be blank")
      end

      it 'shipping_daysが未選択では出品できない' do
        @item.shipping_days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping days can't be blank")
      end

      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'priceが¥300未満では出品できない' do
        @item.price = '200'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it 'priceが¥9,999,999未満では出品できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it 'priceが半角でなければ出品できない' do
        @item.price = '１００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'priceが数値でなければ出品できない' do
        @item.price = '文字'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
