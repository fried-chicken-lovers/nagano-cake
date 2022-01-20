class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to new_admin_item_path
  end

  def edit
  end

  def update
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :price, :image, :is_deleted, :genre_id)
  end
end
