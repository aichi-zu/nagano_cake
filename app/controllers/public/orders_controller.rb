class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new # 注文情報入力画面(支払方法・配送先の選択)/注文確定処理
    # viweページのみ
    # 処理はcreateに記述
  end

  def confirm # 注文情報確認画面
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @shipping_fee = 800
    @selected_payment_method = params[:order][:payment_method]

    # 商品合計額の計算
    ary = []
    @cart_items.each do |cart_item|
      ary << cart_item.item.price_excluding_tax*cart_item.amount
    end
    @cart_items_price = ary.sum # 商品の小計
    @total_price = @shipping_fee + @cart_items_price # 商品の小計+送料

    # 配送先の指定
    @address_type = params[:order][:address_type]
    case @address_type
    when "customer_address" # 会員登録の住所に配送
      @selected_address = current_customer.post_code + " " + current_customer.address + " " + current_customer.last_name + current_customer.first_name
    when "registered_address" # 配送先登録済みの住所に配送
      unless params[:order][:registered_address_id] == ""
        selected = Address.find(params[:order][:registered_address_id])
        @selected_address = selected.post_code + " " + selected.address + " " + selected.name
      else
        render :new
      end
    when "new_address" #新たな配送先住所に配送
        unless params[:order][:new_post_code] == "" && params[:order][:new_address] == "" && params[:order][:new_name] == ""
        @selected_address = params[:order][:new_post_code] + " " + params[:order][:new_address] + " " + params[:order][:new_name]
      else
        render :new
      end
    end     
  end

  def create # 注文情報入力画面(支払方法・配送先の選択)/注文確定処理
    @order = Order.new
    @order.customer_id = current_customer.id
    @order.shipping_fee = 800
    @cart_items = CartItem.where(customer_id: current_customer.id)

    ary = []
      @cart_items.each do |cart_item|
        ary << cart_item.item.price_excluding_tax*cart_item.amount
      end
      @cart_items_price = ary.sum
      @order.total_price = @order.shipping_fee + @cart_items_price

    @order.payment_method = params[:order][:payment_method].presence || "credit_card"
    if @order.payment_method == "credit_card"
      @order.status = 1
    else
      @order.status = 0
    end
    
    address_type = params[:order][:address_type]
    case address_type
    when "customer_address"
      @order.post_code = current_customer.post_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    when "registered_address"
      Address.find(params[:order][:registered_address_id])
      selected = Address.find(params[:order][:registered_address_id])
      @order.post_code = selected.post_code
      @order.address = selected.address
      @order.name = selected.name
    when "new_address"
      @order.post_code = params[:order][:new_post_code]
      @order.address = params[:order][:new_address]
      @order.name = params[:order][:new_name]
    end
  
    if @order.save
      session[:order_id] = @order.id # OrderのIDをセッションに保存
      if @order.status == 0
        @cart_items.each do |cart_item|
          OrderDetail.create!(order_id: @order.reload.id, item_id: cart_item.item.id, purchase_price: (cart_item.item.price_excluding_tax*1.1).floor, quantity: cart_item.amount, status: 0)
        end
      else
        @cart_items.each do |cart_item|
          OrderDetail.create!(order_id: @order.reload.id, item_id: cart_item.item.id, purchase_price: (cart_item.item.price_excluding_tax*1.1).floor, quantity: cart_item.amount, status: 1)
        end
      end
      @cart_items.destroy_all
      redirect_to thanks_orders_path
    else
      render :items
    end   
  end

  def index # 注文履歴画面
    @orders = Order.where(customer_id: current_customer.id).order(created_at: :desc)
  end

  def show # 注文履歴詳細画面
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id)
  end

  def thanks # 注文完了画面
  end

end
