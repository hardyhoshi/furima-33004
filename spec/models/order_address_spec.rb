require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe '商品購入' do
    it '必要な情報を適切に入力されていれば、商品の購入ができる' do
      expect(@order_address).to be_valid
    end
    it 'postal_codeが空だと購入できない' do
      @order_address.postal_code = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid. Include hyphen(-)")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと購入できない' do
      @order_address.postal_code = "1234-567"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it 'prefecture_idを選択していないと購入できない' do
      @order_address.prefecture_id = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture can't be blank", "Prefecture can't be blank")
    end
    it 'prefecture_idが1(---)ではと購入できない' do
      @order_address.prefecture_id = 1
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture must be other than 1")
    end
    it 'municipalityが空だと購入できない' do
      @order_address.municipality = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
    end
    it 'street_numberが空だと購入できない' do
      @order_address.street_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Street number can't be blank")
    end
    it 'building_nameが空でも購入できる' do
      @order_address.building_name = nil
      expect(@order_address).to be_valid
    end
    it 'phone_numberが空だと購入できない' do
      @order_address.phone_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
    end
    it 'phone_numberは全角数字では購入できない' do
      @order_address.phone_number = "１２３４５６７８９"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid")
    end
    it 'phone_numberはハイフンがあると購入できない' do
      @order_address.phone_number = "090-9999-9999"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid")
    end
    it 'phone_numberは11桁以上だと購入できない' do
      @order_address.phone_number = "090999999999999"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid")
    end
  end
end
