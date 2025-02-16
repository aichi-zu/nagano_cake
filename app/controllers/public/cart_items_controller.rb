class Public::CartItemsController < ApplicationController
 before_action :authenticate_customer!
  def index
    @cart_items = current_customer.cart_items.includes(:item)
    @total_price = @cart_items.sum { |cart_item| cart_item.item.price_excluding_tax * cart_item.amount * 1.1 }
  end

  def update
  end

  def destroy
   cart_item = CartItem.find(params[:id])
   cart_item.destroy
   redirect_to public_cart_items_path, notice: "カートから商品を削除しました"
  end

  def destroy_all
   current_customer.cart_items.destroy_all
   redirect_to public_cart_items_path, notice: "カートを空にしました"
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

