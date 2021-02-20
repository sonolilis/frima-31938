# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| nickname   | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| name       | string | null: false |
| name_kana  | string | null: false |
| birthday   | date   | null: false |

### Association

- has_many :buys
- has_many :orders
- has_many :comments

## buys テーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| credit_card     | integer    | null: false |
| post_number     | string     | null: false |
| prefecture      | string     | null: false |
| city            | string     | null: false |
| address         | string     | null: false |
| phone_number    | string     | null: false |


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

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| product_name     | string     | null: false                    |
| image            | reference  | null: false, foreign_key: true |
| price            | integer    | null: false                    |
| description      | text       | null: false                    |
| nickname         | string     | null: false                    |
| status           | string     | null: false                    |
| shipping         | integer    | null: false                    |
| shipment_source  | string     | null: false                    |
| date_of_shipment | date       | null: false                    |


### Association

- belongs_to       :users
- belongs_to       :buys
- has_many         :comments
- has_many         :order_categories
- has_many_through :categories


## categories テーブル

| Column          | Type       | Options     |
| ----------      | ---------- | ----------- |
| category_name   | string     | null: false |


### Association

- has_many          :order_categories
- has_many_through  :orders


## order_category テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| order           | references | null: false, foreign_key: true |
| category        | references | null: false, foreign_key: true |


### Association

- belongs_to :orders
- belongs_to :categories