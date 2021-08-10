# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| name               | string | null: false |
| pronunciationkey   | string | null: false |
| birthday           | integer| null: false |

### Association

- has_many :items
- has_many :buy

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| itemname           | text       | null: false                    |
| text               | text       | null: false                    |
| category           | integer    | null: false                    |
| status             | integer    | null: false                    |
| load               | integer    | null: false                    |
| area               | integer    | null: false                    |
| days               | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buy

## buy テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| card   | integer    | null: false                    |
|deadline| integer    | null: false                    |
|security| integer    | null: false                    |
| user   | references | null: false, foreign_key: true |

### Association

- has_one :shippingaddress
- belongs_to :items

## shippingaddress テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| postalcode         | integer| null: false |
| prefectures        | integer| null: false |
| municipalities     | string | null: false |
| address            | string | null: false |
| building           | string |             |
| phone              | integer| null: false |

### Association

- belongs_to :buy
