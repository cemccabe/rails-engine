FactoryBot.define do
  factory :item do
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.paragraph }
    unit_price { Faker::Commerce.price }
    merchant_id { Merchant.all.shuffle.first.id }
  end
end
