class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_many :products
  has_many :buyed_products, foreign_key: "buyer_id", class_name: "Product"
  has_many :saling_products, -> { where("buyer_id is NULL") }, foreign_key: "saler_id", class_name: "Product"
  has_many :sold_products, -> { where("buyer_id is not NULL") }, foreign_key: "saler_id", class_name: "Product"


  # ------クレジット機能追加時に使用-----
  has_one :credit_card, dependent: :destroy

  has_one :address, dependent: :destroy
  
  validates :nickname, presence: true, uniqueness: true
  validates :email, presence: true
  validates :password, presence: true

  validates :first_name, format: {
    with: /\A[ぁ-んァ-ン一-龥]/,
    message: "は全角ひらがな、カタカナ、漢字で入力して下さい"
  }, allow_blank: true
  validates :first_name, presence: true

  validates :last_name, format: {
    with: /\A[ぁ-んァ-ン一-龥]/,
    message: "は全角ひらがな、カタカナ、漢字で入力して下さい"
  }, allow_blank: true
  validates :last_name, presence: true

  validates :first_name_kana, format: {
    with: /\A[ァ-ヶー－]+\z/,
    message: "は全角カタカナで入力して下さい"
  }, allow_blank: true
  validates :first_name_kana, presence: true

  validates :last_name_kana, format: {
    with: /\A[ァ-ヶー－]+\z/,
    message: "は全角カタカナで入力して下さい"
  }, allow_blank: true
  validates :last_name_kana, presence: true

  validates :birthday_year, presence: true
  validates :birthday_month, presence: true
  validates :birthday_day, presence: true

  validates :tel, format: {
    with: /\A\d{10,11}\z/,
    message: "はハイフンなし10桁or11桁で入力して下さい"
  }, allow_blank: true
  validates :tel, presence: true, uniqueness: true
end
