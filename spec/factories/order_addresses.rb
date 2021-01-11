FactoryBot.define do
  factory :order_address do
    postal_code    { '123-4567' }
    prefecture_id  { 3 }
    municipality   { '岡崎市' }
    street_number  { '1-1' }
    building_name  { '都築ビル' }
    phone_number   { '0900000000' }
    token          { 'tok_abcdefghijk00000000000000000' }
    user_id        { 1 }
    item_id        { 1 }
  end
end
