class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  def subtotal
    (item.price_excluding_tax * 1.1).floor * amount
  end
end
