FactoryBot.define do
  factory :item do
    name { Faker::Name.unique.name }
    info { Faker::Lorem.sentence }
    category { Category.where.not(id: 1).sample }
    status { Status.where.not(id: 1).sample }
    fee_status { FeeStatus.where.not(id: 1).sample }
    prefecture { Prefecture.where.not(id: 1).sample }
    delivery { Delivery.where.not(id: 1).sample }
    price { Faker::Number.between(from: 300, to: 9_999_999) }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
