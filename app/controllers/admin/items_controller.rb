class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all.includes(:genre).page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
  end
end
