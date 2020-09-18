# README

## usersテーブル

| column      | Type    | options     | 
| ----------- | ------  | ----------- |
| name        | string  | null: false |
| email       | string  | null: false |
| password    | string  | null: false |
| first_name  | string  | null: false |
| last_name   | string  | null: false |
| birth_year  | integer | null: false |
| birth_month | integer | null: false |
| birth_day   | integer | null: false |

### Association
 has_many: items
 has_one: buyers 


## itemsテーブル

| column          | Type       | options                        |
| --------------- | ---------- | ------------------------------ |
| product_name    | string     | null: false                    |
| image           | string     | null: false                    |
| value           | integer    | null: false                    |
| category        | string     | null: false                    |
| state           | string     | null: false                    |
| freight         | integer    | null: false                    |
| shipment_region | integer    | null: false                    |
| shipdate        | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association
 belongs_to :users
 has_one :managements


## buyersテーブル

| column        | Type       | options                        |
| ------------- | ---------- | ------------------------------ |
| card_number   | integer    | null: false                    |
| exp_month     | integer    | null: false                    |
| exp_year      | integer    | null: false                    |
| approval_code | integer    | null: false                    |
| postal_code   | string     | null: false                    |
| region        | string     | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_num     | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association
 belongs_to :user
 has_many :buyers


## managements テーブル

| column   | Type       | options                        |
| -------- | ---------  | ------------------------------ |
| stock    | boolean    | null: false                    |
| item_id  | references | null: false, foreign_key: true |
| buyer_id | references | null: false, foreign_key: true |

### Association
 belongs_to :item
 belongs_to :buyer