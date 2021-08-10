# テーブル設計

## users テーブル

| Column             | Type   | Options                        |
| ------------------ | ------ | ------------------------------ |
| nickname           | string | null: false                    |
| email              | string | null: false, unique: true      |
| encrypted_password | string | null: false                    |
| lastname           | string | null: false                    |
| firstname          | string | null: false                    |
| lastname_kana      | string | null: false                    |
| firstname_kana     | string | null: false                    |
| birthday           | date   | null: false                    |

### Association

- has_many :items
- has_many :buys

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| itemname           | string     | null: false                    |
| text               | text       | null: false                    |
| category_id        | integer    | null: false                    |
| status_id          | integer    | null: false                    |
| load_id            | integer    | null: false                    |
| area_id            | integer    | null: false                    |
| shipping_day_id    | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buy

## buy テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- has_one :shippingaddress
- belongs_to :items
- belongs_to :users


## shippingaddress テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| postalcode         | string | null: false |
| area_id            | integer| null: false |
| municipalities     | string | null: false |
| address            | string | null: false |
| building           | string |             |
| phone              | string | null: false |

### Association

- belongs_to :buy
