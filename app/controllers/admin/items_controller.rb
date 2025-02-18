class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all.includes(:genre).page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
    @tax_included_price = (@item.price_excluding_tax * 1.1).floor
  end
end
