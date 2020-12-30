class ItemOrder

  include ActiveModel::Model
  attr_accesor :postal_code, :prefecture, :municipality, :street_number, :building_name, :phone_number

end