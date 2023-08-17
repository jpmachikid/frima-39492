FactoryBot.define do
  factory :item do
    item_name {Faker::JapaneseMedia::DragonBall.character}
    description {Faker::Lorem.sentence}
    category_id {Faker::Number.between(from: 1, to: 10)}
    condition_id {Faker::Number.between(from: 1, to: 6)}
    shipping_fee_id {Faker::Number.between(from: 1, to: 2)}
    prefecture_id {Faker::Number.between(from: 1, to: 47)}
    shipping_date_id {Faker::Number.between(from: 1, to: 3)}
    price {Faker::Number.between(from: 300, to: 9999999) }

    association :user
    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'),filename: 'test_image.png')
    end
  end
end
