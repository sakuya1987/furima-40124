FactoryBot.define do
  factory :user do
    # インスタンスを生成
    japanese_user = Gimei.name
    random_date = Faker::Date.between(from: '1930-01-01', to: '2018-12-31')

    nickname { Faker::Name.unique.first_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name { japanese_user.last.kanji }
    first_name { japanese_user.first.kanji }
    last_name_kana  { japanese_user.last.katakana }
    first_name_kana { japanese_user.first.katakana }
    birth_date { random_date }
  end
end
