class ItemOrder

  include ActiveModel::Model
  attr_accesor :postal_code, :prefecture, :municipality, :street_number, :building_name, :phone_number

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :prefecture, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipality
    validates :street_number
    validates :phone_number, numericality: {less_than_or_equal_to: 11}
  end

end