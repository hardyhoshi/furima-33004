require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end
  
  describe '商品購入' do
    context '商品購入できるとき' do
      it '必要な情報を適切に入力されていれば、商品の購入ができる' do
        expect(@order_address).to be_valid
      end
      it 'building_nameが空でも購入できる' do
        @order_address.building_name = nil
        expect(@order_address).to be_valid
      end
    end

    context '商品購入できないとき' do
      it 'postal_codeが空だと購入できない' do
        @order_address.postal_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと購入できない' do
        @order_address.postal_code = '1234-567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('郵便番号はハイフン(-)を入れてください')
      end
      it 'prefecture_idを選択していないと購入できない' do
        @order_address.prefecture_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("都道府県を選択してください")
      end
      it 'prefecture_idが1(---)では購入できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('都道府県を選択してください')
      end
      it 'municipalityが空だと購入できない' do
        @order_address.municipality = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("市区町村を入力してください")
      end
      it 'street_numberが空だと購入できない' do
        @order_address.street_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("番地を入力してください")
      end
      it 'phone_numberが空だと購入できない' do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号を入力してください")
      end
      it 'phone_numberは全角数字では購入できない' do
        @order_address.phone_number = '１２３４５６７８９'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号はハイフン(-)を含めず半角数字で入力してください')
      end
      it 'phone_numberはハイフンがあると購入できない' do
        @order_address.phone_number = '090-9999-9999'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号はハイフン(-)を含めず半角数字で入力してください')
      end
      it 'phone_numberは11桁以上だと購入できない' do
        @order_address.phone_number = '090999999999999'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号はハイフン(-)を含めず半角数字で入力してください')
      end
      it 'tokenが空では登録できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
      it 'user_idが空では登録できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Userを入力してください")
      end
      it 'item_idが空では登録できないこと' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Itemを入力してください")
      end
    end
  end
end
    