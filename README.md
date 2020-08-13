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
-has_many :delivery_address
-has_many :Purchase


## items テーブル
| Column        | Type       | Option                         |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| image         | text       | null: false                    |
| price         | integer    | null: false                    |
| explanation   | text       | null: false                    |
| prefecture    | string     | null: false                    |
| user          | references | null: false, foreign_key: true | 

### Association

-belongs_to :user
-has_many   :comments
-has_one    :delivery_address
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
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association

-belongs_to :user
-belongs_to :item
-has_one    :delivery_address


## delivery_address テーブル
| Column        | Type       | Option                         |
| ------------- | ---------- | ------------------------------ |
| postal_code   | integer    | null: false                    |
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | integer    | null: false                    |
| purchase      | references | null: false, foreign_key: true |

### Association

-belongs_to :purchase


