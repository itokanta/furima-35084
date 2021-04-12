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
|email    |string |null: false|
|password |string |null: false|
|name     |string |null: false|
|name_furigana|string|null: false|
|birth_year   |string|null: false|
|birth_month  |string|null: false|
|birth_day    |string|null: false|

### Association
- has_many :items
- has_many :buys

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|foreign_key: true|
|item|references|foreign_key: true|
|category|string|null: false|
|status  |string|null: false|
|description|string|null: false|
|postage    |string|null: false|
|from       |string|null: false|
|send_about |string|null: false|
|price      |integer|null: false|

### Association
- belongs_to :user
- has_one :buys

## buysテーブル
|Column|Type|Options|
|------|----|-------|
|item|references|foreign_key: true|
|user|references|foreign_key: true|
|phone      |integer|null: false|
|card       |integer|null: false|
|card_deadline|integer|null: false|
|card_security|integer|null: false|

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

### Association
- belongs_to :buys