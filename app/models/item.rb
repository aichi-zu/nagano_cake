class Item < ApplicationRecord
  has_one_attached :image
  has_many :cart_items, dependent: :destroy
  belongs_to :genre
  has_one_attached :image
  
 def with_tax_price
  (price_excluding_tax * 1.1).floor
 end
end
