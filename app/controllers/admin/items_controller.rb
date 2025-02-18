class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all.includes(:genre).page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
    @tax_included_price = (@item.price_excluding_tax * 1.1).floor
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item), notice: "商品を登録しました"
    else
      @genres = Genre.all
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :introduction, :price_excluding_tax, :is_sale, :image)
  end
end
