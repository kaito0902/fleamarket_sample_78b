# README

# 　　　　　　　　フリーマーケットサイト
<img width="1440" alt="スクリーンショット 2020-07-23 10 35 23" src="https://user-images.githubusercontent.com/66351057/88250227-e03ca480-cce1-11ea-9ad8-cbf8de8642e2.png">

# 主な使用言語
- Haml
- SCSS 
- Ruby
- JavaScript

# 機能紹介
- 新規会員登録・ログインをすると商品の購入、出品ができます。
- 新規会員登録、ログインがお済みでない方も商品の一覧、詳細を閲覧可能です。
- 決済方法はご自身のクレジットカードを登録して購入できます。

# 制作メンバー&実装内容の紹介
## 平田 侑也
- スクラムマスター
- ユーザーマイページ
- 商品一覧表示(マークアップ)
- 商品購入機能（Payjp)
- クレジットカード登録（Payjp)
- ER図編集
## 坂田 海斗
- デプロイ担当、AWS EC2~S3導入
- パンくず機能
- お気に入り機能
- 商品出品ページ
- 商品出品機能
## 吉野 智也
- メンター
- 商品についての質問・コメント機能
- カテゴリ機能
- トップページ
## 尾崎 正
- 商品購入確認ページ(マークアップ)
- 商品検索機能
- 商品詳細表示機能
- ユーザー新規登録/ログインページ(マークアップ)
## 杉本 好隆
- 商品詳細ページ(マークアップ)
- 商品削除機能
- 商品編集機能
- ユーザー新規登録/ログイン機能
- README編集

![freamarket_78最終課題b　データベース設計ER図 (8)](https://user-images.githubusercontent.com/55152588/88256341-053b1280-ccf6-11ea-897e-82fb2344792c.png)

# DB設計
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
|birthday_year|integer|null: false|
|birthday_month|integer|null: false|
|birthday_day|integer|null: false|
|tel|string|unique: true|

### Association
- has_many :products
- has_many :comments
- has_many :bookmarks, dependent: :destroy
- has_one :credit_card, dependent: :destroy
- has_one :address, dependent: :destroy


## productsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|condition|references|null: false, foreign_key: true|
|category|references|null: false, foreign_key: true|
|brand|references|foreign_key: true|
|delivery_charge|references|null: false, foreign_key: true|
|prefecture|integer|null: false|
|day|string|null: false|
|price|integer|null: false|
|saler_id|integer|foreign_key: true|
|buyer_id|integer|foreign_key: true|

### Association
- has_many :images
- has_many :bookmarks, dependent: :destroy
- belongs_to :category
- belongs_to :brand
- belongs_to :delivery_charge
- belongs_to :condition

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
- belongs_to :user, optional: true

## conditionsテーブル
|Column|Type|Options|
|------|----|-------|
|status|string|null: false|

### Association
- has_many :products

## delivery_chargesテーブル
|Column|Type|Options|
|------|----|-------|
|charge_rule|string|null: false|

### Association
- has_many :products

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|product|references|foreign_key: true|
|url|string||

### Association
- belongs_to :product

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|index: ture|

### Association
- has_many :products
- has_ancestry

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :products

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer||
|product_id|integer||
|text|text||

### Association
- belongs_to :product
- belongs_to :user

## bookmarksテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false,foreign_key: true|
|product|references|null: false,foreign_key: true|

### Association
- belongs_to :user
- belongs_to :product
