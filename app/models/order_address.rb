class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :street_number, :building_name, :phone_number, :user_id, :item_id,
                :token

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'はハイフン(-)を入れてください', allow_blank: true }
    validates :prefecture_id, numericality: { other_than: 1, message: 'を選択してください' }
    validates :municipality
    validates :street_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/, allow_blank: true, message: 'はハイフン(-)を含めず半角数字で入力してください' }
    validates :user_id
    validates :item_id
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality,
                   street_number: street_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
