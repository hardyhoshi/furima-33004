FactoryBot.define do
  factory :item do
    name               { Faker::Lorem.sentence }
    info               { Faker::Lorem.sentence }
    category_id        { 3 }
    item_status_id     { 3 }
    shipping_charge_id { 3 }
    prefecture_id      { 3 }
    delivery_day_id    { 3 }
    price              { 10_000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
