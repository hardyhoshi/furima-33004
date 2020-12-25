class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

  with_options presence: true do
    validates :name
    validates :info
    validates :category_id
    validates :item_status_id
    validates :shipping_charge_id
    validates :prefecture_id
    validates :delivery_day_id
    validates :price
    validates :image
  end

  validates :item_status_id, numericality: { other_than: 1 }
end
