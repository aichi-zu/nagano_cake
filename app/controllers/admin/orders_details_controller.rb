class Admin::OrdersDetailsController < ApplicationController

  def update
    @order_detail_update_target = OrderDetail.find(params[:id])

    if @order_detail_update_target.update(order_detail_params)
      redirect_to request.referer, notice: "製作ステータスを更新しました"
    else
      render :show
    end

  end

  private
    def order_detail_params
      params.require(:order_detail).permit(:status)
    end

end
