class Product < ApplicationRecord
  has_many :images
  belongs_to :category
  belongs_to :brand
  belongs_to :delivery_charge
  belongs_to :condition
  belongs_to :user
end
