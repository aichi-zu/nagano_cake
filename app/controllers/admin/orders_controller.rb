class Admin::OrdersController < ApplicationController

  def show
    @order_update_target = Order.find(params[:id])
    @order_details_index = OrderDetail.where(order_id: params[:id])
  end

  def update
    @order_update_target = Order.find(params[:id])

    if @order_update_target.update(order_params)
      redirect_to request.referer, notice: "注文ステータスを更新しました"
    else
      render :show
    end
  end

  private
    def order_params
      params.require(:order).permit(:status)
    end

end
