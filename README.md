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
Column | Type | Options

## usersテーブル
1. nickname | string | null: false
2. email | string | null: false
3. password | string | null: false
4. name | string | null: false
5. name_furigana | string | null: false
6. birth_year | string | null: false
7. birth_month | string | null: false
8. birth_day | string | null: false

### Association
- has_many :items
- has_many :buys

## itemsテーブル
1. user | references | foreign_key: true
2. item | references | foreign_key: true
3. image | ActiveStorage使用
4. category | string | null: false
5. status | string | null: false
6. description | string | null: false
7. postage | string | null: false
8. from | string | null: false
9. send_about | string | null: false
10. price | integer | null: false

### Association
- belongs_to :user
- has_one :buys

## buysテーブル
1. item | references | foreign_key: true
2. user | references | foreign_key: true
3. postal_code | integer | null: false
4. prefecture | string | null: false
5. cities | string | null: false
6. address | integer | null: false
7. build_name | string | none
8. phone | integer | null: false
9. card | integer | null: false
10. card_deadline | integer | null: false
11. card_security | integer | null: false

### Association
- belongs_to :user
- belongs_to :items