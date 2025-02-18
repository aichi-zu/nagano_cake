class Item < ApplicationRecord
  has_one_attached :image
  has_many :cart_items, dependent: :destroy
  has_many :order_details
  has_many :orders, through: :order_details

 def with_tax_price
  (price_excluding_tax * 1.1).floor
 end
end
