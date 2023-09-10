FactoryBot.define do
  factory :order_shipment do
    postal_code {'123-4567'}
    prefecture_id {1}
    city {Faker::Address.city}
    house_number {Faker::Address.street_address}
    building {Faker::Restaurant.name}
    telephone {Faker::Number.number(digits:11)}
  end
end
