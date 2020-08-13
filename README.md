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
| Column      | Type     | Option      |
| ----------- | -------- | ----------- |
| name        | string   | null: false |
| name_reading| string   | null: false |
| nickname    | string   | null: false |
| email       | string   | null: false |
| password    | string   | null: false |
| birthday    | date     | null: false |

### Association

-has_many :items
-has_many :comments
-has_many :delivery_address
-has_many :Purchase


## items テーブル
| Column        | Type       | Option                         |
| ------------- | ---------- | ------------------------------ |
| item_name     | string     | null: false                    |
| price         | integer    | null: false                    |
| explanation   | text       | null: false                    |
| category      | string     | null: false                    |
| status        | string     | null: false                    |
| charges       | string     | null: false                    |
| delivery_date | date       | null: false                    | 
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


## Purchase テーブル
| Column           | Type       | Option                         |
| ---------------- | ---------- | ------------------------------ |
| card_number      | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |
| delivery_address | references | null: false, foreign_key: true |

### Association

-belongs_to :user
-belongs_to :item
-belongs_to :delivery_address


## delivery_address テーブル
| Column        | Type       | Option                         |
| ------------- | ---------- | ------------------------------ |
| postal_code   | integer    | null: false                    |
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |
| Purchase      | references | null: false, foreign_key: true |

### Association

-belongs_to :user
-belongs_to :item
-has_one    :Purchase


