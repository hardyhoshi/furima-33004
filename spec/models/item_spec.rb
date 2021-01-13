require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品登録' do
    context '出品登録できるとき' do
      it 'image、name、info、category_id、item_status_id、shipping_charge_id、prefecture_id、delivery_day_id、priceがあれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '出品登録できないとき' do
      it '画像(image)がなければ登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("出品画像を入力してください")
      end
      it '商品名(name)がなければ登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it '商品の説明(info)がなければ登録できない' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it 'カテゴリー情報(category_id)がなければ登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
      end
      it 'カテゴリー情報(category_id)が---(1)では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーを選択してください')
      end
      it '商品の状態についての情報(item_status_id)がなければ登録できない' do
        @item.item_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を選択してください")
      end
      it '商品の状態についての情報(item_status_id)が---(1)では登録できない' do
        @item.item_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の状態を選択してください')
      end
      it '配送料の負担についての情報(shipping_charge_id)がなければ登録できない' do
        @item.shipping_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を選択してください")
      end
      it '配送料の負担についての情報(shipping_charge_id)が---(1)では登録できない' do
        @item.shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('配送料の負担を選択してください')
      end
      it '発送元の地域についての情報(prefecture_id)がなければ登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を選択してください")
      end
      it '発送元の地域についての情報(prefecture_id)が---(1)では登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('発送元の地域を選択してください')
      end
      it '発送までの日数についての情報(delivery_day_id)がなければ登録できない' do
        @item.delivery_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を選択してください")
      end
      it '発送までの日数についての情報(delivery_day_id)が---(1)では登録できない' do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('発送までの日数を選択してください')
      end
      it '価格についての情報(price)がなければ登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格を入力してください")
      end
      it '価格が299円以下では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は半角数字で300~9999999の間で入力してください')
      end
      it '価格が10,000,000円以上では登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は半角数字で300~9999999の間で入力してください')
      end
      it '価格が全角数字では登録できない' do
        @item.price = '１００００'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は半角数字で300~9999999の間で入力してください')
      end
      it '価格が半角英数混合では登録できない' do
        @item.price = '100abc'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は半角数字で300~9999999の間で入力してください')
      end
      it '価格が半角英語だけでは登録できない' do
        @item.price = 'abcde'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は半角数字で300~9999999の間で入力してください')
      end
      it 'ユーザーが紐付いていなければ登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
