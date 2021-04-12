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
|birthday|date|null: false|

### Association
- has_many :items
- has_many :buys

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|foreign_key: true|
|name    |string|null: false|
|category_id|integer|null: false|
|status_id  |integer|null: false|
|description|text   |null: false|
|postage_id |integer|null: false|
|from_id    |integer|null: false|
|send_about_id|integer|null: false|
|price        |integer|null: false|

### Association
- belongs_to :user
- has_one :buy

## buysテーブル
|Column|Type|Options|
|------|----|-------|
|item|references|foreign_key: true|
|user|references|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|string |null: false|
|from_id    |integer|null: false|
|cities     |string |null: false|
|address    |string |null: false|
|build_name |string |none|
|phone      |string |null: false|

### Association
- belongs_to :buy