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

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname |string |null: false|
|email    |string |null: false, unique: true|
|encrypted_password|string |null: false|
|second_name  |string|null: false|
|first_name   |string|null: false|
|second_furigana|string|null: false|
|first_furigana |string|null: false|
|date|string|null: false|

### Association
- has_many :items
- has_many :buys

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|foreign_key: true|
|name    |string|null: false|
|category_id|string|null: false|
|status_id  |string|null: false|
|description|string|null: false|
|postage_id |string|null: false|
|from_id    |string|null: false|
|send_about_id|string|null: false|
|price      |integer|null: false|

### Association
- belongs_to :users
- has_one :buys
- belongs_to :fixity

## buysテーブル
|Column|Type|Options|
|------|----|-------|
|item|references|foreign_key: true|
|user|references|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :items
- has_one :addresses

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|integer|null: false|
|prefecture |string |null: false|
|cities     |string |null: false|
|address    |integer|null: false|
|build_name |string |none|
|phone      |integer|null: false|

### Association
- belongs_to :buys