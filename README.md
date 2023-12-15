# README
# テーブル設計　

## users テーブル

| Column                 | Type   | Options                   |
| ---------------------- | ------ | ------------------------- |
| nickname               | string | null: false               |
| email                  | string | null: false, unique: true |
| encrypted_password     | string | null: false               |
| last_name              | string | null: false               |
| first_name             | string | null: false               |
| last_name_kana         | string | null: false               |
| first_name_kana        | string | null: false               |
| birth_date             | Date   | null: false               |

### Association

- has_many :items
- has_many :orders

## items テーブル　

| Column             | Type        | Options                        |
| ------------------ | ----------- | ------------------------------ |
| name               | text        | null: false                    |
| info               | text        | null: false                    |
| category_id        | integer     | null: false                    |
| status_id          | integer     | null: false                    |
| fee_status_id      | integer     | null: false                    |
| prefecture_id      | integer     | null: false                    |
| delivery_id        | integer     | null: false                    |
| price              | integer     | null: false                    |
| user               | references  | null: false, foreign_key: true |
- imageは、ActiveStorageで実装するため、テーブル設計内の記述に含めない。
### Association

- belongs_to :user
- has_one.   :older

## orders テーブル

| Column             | Type        | Options                        |
| ------------------ | ----------- | ------------------------------ |
| user               | references  | null: false, foreign_key: true |
| item               | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :address

## addresses テーブル

| Column             | Type        | Options                        |
| ------------------ | ----------- | ------------------------------ |
| postal_code        | String      | null: false                    |
| prefecture_id      | integer     | null: false                    |
| city               | String      | null: false                    |
| addresses          | String      | null: false                    |
| building           | String      | null: false                    |
| phone_number       | String      |                                |
| older              | references  | null: false, foreign_key: true |


### Association

- belongs_to order
