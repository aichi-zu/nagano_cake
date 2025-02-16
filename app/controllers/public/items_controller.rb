class Public::ItemsController < ApplicationController
  before_action :authenticate_customer! 

  def index
      @items = Item.all
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
