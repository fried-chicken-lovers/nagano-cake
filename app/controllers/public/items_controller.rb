class Public::ItemsController < ApplicationController
  def index
    @items = Item.all.page(params[:page]).per(3)
  end

  def show
    @item = Item.find(params[:id])
    @cart = Cart.new
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :price, :image_id, :is_deleted, :genre_id, :is_deleted)
  end
end
