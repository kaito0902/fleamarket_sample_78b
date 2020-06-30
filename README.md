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

# fleamarket_sample_78b DB設計
## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|birthday_year|date|null: false|
|birthday_month|date|null: false|
|birthday_day|date|null: false|
|tel|integer|unique: true|
|address|references|null: false, foreign_key: true|

### Association
- has_many :products
- has_one :credit_card, dependent: :destroy


## productsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|condition|references|null: false, foreign_key: true|
|category|references|null: false, foreign_key: true|
|delivery_charge|references|null: false, foreign_key: true|
|area|references|null: false, foreign_key: true|
|day|references|null: false, foreign_key: true|
|price|integer|null: false|
|image|references|null: false, foreign_key: true|

### Association
- belongs_to :user

## Credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|card_number|integer|null: false, unique: true|
|expiration_year|integer|null: false|
|expiration_month|integer|null: false|
|security_code|integer|null: false|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :user