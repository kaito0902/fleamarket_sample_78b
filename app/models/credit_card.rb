class CreditCard < ApplicationRecord
  # belongs_to :product
  belongs_to :user

  validates :customer_id, presence: true
  validates :card_token, presence: true

  end
