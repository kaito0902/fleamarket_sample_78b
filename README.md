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
|tel|string|unique: true|

### Association
- has_many :products
- has_one :credit_card, dependent: :destroy
- has_one :address, dependent: :destroy


## productsテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|name|string|null: false|
|description|text|null: false|
|condition|references|null: false, foreign_key: true|
|category|references|null: false, foreign_key: true|
|brand|references|null: false, foreign_key: true|
|delivery_charge|references|null: false, foreign_key: true|
|prefecture|string|null: false|
|day|string|null: false|
|price|integer|null: false|

### Association
- has_many :images
- belongs_to :category
- belongs_to :brand
- belongs_to :delivery_charge
- belongs_to :condition
- belongs_to :user

## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|customer_id|string|null: false|
|card_token|string|null: false|

### Association
- belongs_to :user

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|post_code|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|house_number|integer|null: false|
|building_name|string|null: false|

### Association
- belongs_to :user

## conditionsテーブル
|Column|Type|Options|
|------|----|-------|
|status|string|null: false|

### Association
- has_many :products

## delivery_chargesテーブル
|Column|Type|Options|
|------|----|-------|
|product|references|null: false, foreign_key: true|
|charge_rule|string|null: false|

### Association
- belongs_to :product

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|product|references|null: false, foreign_key: true|
|url|string|null: false|

### Association
- belongs_to :product

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|integer|null: false|

### Association
- has_many :products
- has_ancestry

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :products