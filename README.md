# README

# テーブル設計

## users テーブル

| Column               | Type   | Options                   |
| -------------------- | ------ | ------------------------- |
| nick_name            | string | null: false               |
| email                | string | null: false, unique: true |
| password             | string | null: false               |
| password_confimation | string | null: false
| last_name            | string | null: false               |
| first_name           | string | null: false               |
| last_name_kana       | string | null: false               |
| first_name_kana      | string | null: false               |
| birth_date           | date   | null: false               |

### Association

- has_many :items
- has_many :puchase_records



## Items テーブル

| Column                  | Type       | Options                        |
| ----------------------- | ---------- | ------------------------------ |
| item_name               | string     | null: false                    |
| item_info               | text       | null: false                    |
| category_id             | integer    | null: false  foreign_key: true |
| item_sales_status_id    | integer    | null: false                    |
| shipping_free_status_id | integer    | null: false                    |
| prefecture_id           | integer    | null: false                    |
| scheduled_delivery_id   | integer    | null: false                    |
| price                   | integer    | null: false                    |
| user_id                 | integer    | null: false, foreign_key: true |
| brand_id                | integer    | null: false, foreign_key: true |


### Association

- has_many :images
- belongs_to :users
- has_one :purchase_record





## Destinations テーブル

| Column             | Type    | Options                        |
| ------------------ | ------- | ------------------------------ |
| post_code          | string  | null: false, foreign_key: true |
| prefecture         | integer | null: false, foreign_key: true |
| city               | string  | null: false, foreign_key: true |
| addresses          | string  | null: false, foreign_key: true |
| building           | string  | foreign_key: true              |
| phone_number       | string  | null: false, foreign_key: true |

### Association

- belongs_to :users




##  Purchase_recordsテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| user_id              | string     | null: false, foreign_key: true |
| item_id              | string     | null: false, foreign_key: true |


### Association

- belongs_to :users
- has_many :items
- belongs_to : destination
