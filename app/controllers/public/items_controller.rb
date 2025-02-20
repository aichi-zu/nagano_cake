class Public::ItemsController < ApplicationController

  def index
    @items = Item.where(is_sale: true).page(params[:page]).per(8)
    @total_item_count = Item.where(is_sale: true).count
    if current_customer
      @cart_items = CartItem.where(customer_id: current_customer.id)
    else
      @cart_items = []
    end
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end
