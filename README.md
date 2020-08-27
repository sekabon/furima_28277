# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# テーブル設計

## users テーブル
| Column             | Type    | Option      |
| ------------------ | ------- | ----------- |
| first_name         | string  | null: false |
| family_name        | string  | null: false |
| first_name_reading | string  | null: false |
| family_name_reading| string  | null: false |
| nickname           | string  | null: false |
| email              | string  | null: false |
| password           | string  | null: false |
| birthday           | date    | null: false |

### Association

-has_many :items
-has_many :comments
-has_many :Purchase


## items テーブル
| Column          | Type       | Option                         |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| introduction    | text       | null: false                    |
| category_id     | integer    | null: false                    |
| condition_id    | integer    | null: false                    |
| postage_type_id | integer    | null: false                    |
| ship_days_id    | integer    | null: false                    |
| ship_area_id    | integer    | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true | 

### Association

-belongs_to :user
-has_many   :comments
-has_one    :Purchase


## comments テーブル
| Column        | Type       | Option                         |
| ------------- | ---------- | ------------------------------ |
| text          | text       | null: false                    |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

-belongs_to :user
-belongs_to :item


## purchase テーブル
| Column           | Type       | Option                         |
| ---------------- | ---------- | ------------------------------ |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association

-belongs_to :user
-belongs_to :item
-has_one    :delivery_address


## delivery_address テーブル
| Column        | Type       | Option                         |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| purchase      | references | null: false, foreign_key: true |

### Association

-belongs_to :purchase


