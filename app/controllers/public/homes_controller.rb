class Public::HomesController < ApplicationController
  def top
    @items = Item.order(created_at: :desc).limit(4)
    @items = Item.where(is_sale: true)
    @customer = current_customer
  end

  def about
  end
end
