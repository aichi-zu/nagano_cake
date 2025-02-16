class Public::CartItemsController < ApplicationController
 before_action :authenticate_customer!
  def index
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

  def create
    @cart_item = current_customer.cart_items.find_by(item_id: params[:item_id])

    if @cart_item.present?
      @cart_item.amount += params[:amount].to_i
      @cart_item.save
    else
      @cart_item = current_customer.cart_items.new(cart_item_params)
      @cart_item.save
    end

    redirect_to public_cart_items_path, notice: "カートに追加しました"
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

end

