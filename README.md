# README

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nick_name          | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birth_date         | date   | null: false |

### Association

- has_many :items
- belongs_to :card
- belongs_to :destinations



## Items テーブル

| Column               | Type   | Options     |
| -------------------- | ------ | ----------- |
| item_name            | string | null: false |
| item_info            | string | null: false |
| item_sales_status    | string | null: false |
| shipping_free_status | string | null: false |
| prefecture           | string | nill: false |
| price                | int    | null: false |

### Association

- has_many :images
- belongs_to :users
- belongs_to :categories



## Cardテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| card_number        | string | null: false |
| card_exp_mon       | string | null: false |
| card_exp_year      | string | null: false |
| card_cvc           | string | null: false |

### Association

- belongs_to :users



## Destination テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| post_code          | string | null: false |
| prefecture         | string | null: false |
| city               | string | null: false |
| addresses          | text   | null: false |
| building           | string | null: false |
| phone_number       | string | null: false |

### Association

- belongs_to :users



## Image テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| image              | string | null: false |
| item_id            | string | null: false |

### Association

- belongs_to :items



## Categories テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| ancestry           | string | null: false |

### Association

- has_many :items
