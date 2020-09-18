# README

## usersテーブル

| column          | Type    | options     | 
| --------------- | ------  | ----------- |
| name            | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| first_name      | string  | null: false |
| last_name       | string  | null: false |
| first_name_kana | string  | null: false |
| last_name_kana  | string  | null: false |
| birth           | date    | null: false |

### Association
 has_many: items
 has_many: buyers


## itemsテーブル

| column             | Type       | options                        |
| ------------------ | ---------- | ------------------------------ |
| product_name       | string     | null: false                    |
| description        | text       | null: false                    |
| value              | integer    | null: false                    |
| category_id        | integer    | null: false                    |
| state_id           | integer    | null: false                    |
| freight_id         | integer    | null: false                    |
| shipment_region_id | integer    | null: false                    |
| shipdate_id        | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
 belongs_to :user
 has_one :management


## buyersテーブル

| column        | Type       | options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| region        | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_num     | integer    | null: false                    |
| management    | references | null: false, foreign_key: true |

### Association
 belongs_to :management


## managements テーブル

| column   | Type       | options                        |
| -------- | ---------  | ------------------------------ |
| item_id  | references | null: false, foreign_key: true |
| buyer_id | references | null: false, foreign_key: true |

### Association
 belongs_to :item
 belongs_to :user
 has_one :buyer