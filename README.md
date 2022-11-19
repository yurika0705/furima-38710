# README

# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nick_name          | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_date         | date   | null: false               |

### Association

- has_many :items
- has_many :puchase_record
- belongs_to :destinations



## Items テーブル

| Column               | Type       | Options     |
| -------------------- | ---------- | ----------- |
| image                | text       | null: false |
| item_name            | string     | null: false |
| item_info            | text       | null: false |
| item_sales_status    | integer    | null: false |
| shipping_free_status | integer    | null: false |
| prefecture           | integer    | null: false |
| scheduled_delivery   | integer    | null: false |
| price                | integer    | null: false |

### Association

- has_many :images
- belongs_to :users
- belongs_to :categories
- has_one :purchase_record





## Destination テーブル

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




## Categories テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| ancestry           | string | null: false |

### Association

- has_many :items



##  Purchase_recordテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| last_name            | string     | null: false, foreign_key: true |
| first_name           | string     | null: false, foreign_key: true |
| last_name_kana       | string     | null: false, foreign_key: true |
| first_name_kana      | string     | null: false, foreign_key: true |
| birth_date           | date       | null: false, foreign_key: true |
| image                | text       | null: false, foreign_key: true |
| item_name            | string     | null: false, foreign_key: true |
| item_info            | text       | null: false, foreign_key: true |
| item_sales_status    | integer    | null: false, foreign_key: true |
| shipping_free_status | integer    | null: false, foreign_key: true |
| prefecture           | integer    | null: false, foreign_key: true |
| scheduled_delivery   | integer    | null: false, foreign_key: true |
| price                | integer    | null: false, foreign_key: true |



### Association

- belongs_to :users
- has_one :items
