class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_status
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipping_charge
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :presence
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :delivery_day

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

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :item_status_id
    validates :shipping_charge_id
    validates :prefecture_id
    validates :delivery_day_id
  end
end
