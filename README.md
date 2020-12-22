# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column              | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | text       | null: false                    |
| info               | text       | null: false                    |
| category_id        | int        | null: false                    |
| item_status_id     | int        | null: false                    |
| shipping_charge_id | int        | null: false                    |
| prefecture_id      | int        | null: false                    |
| delivery_day_id    | int        | null: false                    |
| price              | int        | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column        | Type        | Options                        |
| ------------- | ----------- | ------------------------------ |
| postal_code   | char(8)     | null: false                    |
| prefecture    | string      | null: false                    |
| municipality  | string      | null: false                    |
| street_number | string      | null: false                    |
| building_name | string      | null: false                    |
| phone_number  | varchar(11) | null: false                    |
| order         | references  | null: false, foreign_key: true |

### Association

- belongs_to :order