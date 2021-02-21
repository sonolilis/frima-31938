# テーブル設計

## users テーブル

| Column               | Type   | Options                  |
| -------------------- | ------ |------------------------- |
| nickname             | string | null: false              |
| email                | string | null: false, unique:true |
| encrypted_password   | string | null: false              |
| last_name            | string | null: false              |
| last_name_kana       | string | null: false              |
| first_name           | string | null: false              |
| first_name_kana      | string | null: false              |
| birthday             | date   | null: false              |

### Association

- has_many :buys
- has_many :orders
- has_many :comments
- has_many :Purchase history

## buys テーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| post_number     | string     | null: false |
| prefecture_id   | integer    | null: false |
| city_id         | string     | null: false |
| address_id      | string     | null: false |
| phone_number_id | string     | null: false |


### Association

- belongs_to :orders
- belongs_to :users


## comments テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| contents        | text       |                                |
| user            | references | null: false, foreign_key: true |
| order           | references | null: false, foreign_key: true |


### Association

- belongs_to :users
- belongs_to :orders


## orders テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| product_name        | string     | null: false                    |
| category            | string     | null: false                    |
| price               | integer    | null: false                    |
| description         | text       | null: false                    |
| nickname            | string     | null: false                    |
| status_id           | integer    | null: false                    |
| shipping_id         | integer    | null: false                    |
| shipment_source_id  | integer    | null: false                    |
| date_of_shipment_id | integer    | null: false                    |


### Association

- belongs_to       :users
- has_one          :buys
- has_many         :comments
- has_one          :Purchase history



## Purchase history テーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| user            | string     | null: false |
| order           | string     | null: false |


### Association

- belongs_to :users
- belongs_to :orders
