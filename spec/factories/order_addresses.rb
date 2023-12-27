FactoryBot.define do
  factory :order_address do
    postal_code { Faker::Number.leading_zero_number(digits: 3) + '-' + Faker::Number.leading_zero_number(digits: 4) }
    prefecture_id {Faker::Number.between(from: 2, to: 48)}
    city {Faker::Address.city}
    address {Faker::Address.street_address}
    building {Faker::Address.secondary_address}
    phone_number {Faker::Number.leading_zero_number(digits: 11)}

    user_id{Faker::Number.between(from: 1, to: 9)}
    item_id{Faker::Number.between(from: 1, to: 9)}
  end
end
