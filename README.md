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

- has_many :orders
- has_many :comments
- has_many :purchase_history

## buys テーブル

| Column          | Type       | Options                       |
| --------------- | ---------- | ----------------------------- |
| post_number     | string     | null: false                   |
| prefecture_id   | integer    | null: false                   |
| city            | string     | null: false                   |
| address         | string     | null: false                   |
| building        | string     |                               |
| phone_number    | integer    | null: false                   |
| user            | references | null: false, foreign_key: true|
| order           | reference  | null: false, foreign_key: true|


### Association

- belongs_to :purchase_history


## comments テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| contents        | text       |                                |
| user            | references | null: false, foreign_key: true |
| order           | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :order


## orders テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| product_name        | string     | null: false                    |
| category_id         | integer    | null: false                    |
| price               | integer    | null: false                    |
| description         | text       | null: false                    |
| status_id           | integer    | null: false                    |
| shipping_id         | integer    | null: false                    |
| shipment_source_id  | integer    | null: false                    |
| date_of_shipment_id | integer    | null: false                    |


### Association

- belongs_to       :user
- has_one          :buy
- has_many         :comments
- has_one          :purchase_history



## purchase_histories テーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| user            | string     | null: false |
| order           | string     | null: false |


### Association

- has_one         :buy
- belongs_to      :user
- belongs_to      :order
