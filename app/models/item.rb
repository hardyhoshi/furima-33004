class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :delivery_day

  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :info, length: { maximum: 1000 }
    with_options numericality: { other_than: 1, message: 'を選択してください' } do
      validates :category_id
      validates :item_status_id
      validates :shipping_charge_id
      validates :prefecture_id
      validates :delivery_day_id
    end
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than: 10_000_000, allow_blank: true, message: 'は半角数字で300~9999999の間で入力してください'}
  end

end
