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
    redirect_to root_path
  end

  def edit
  end

  def update
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :price, :image_id, :is_deleted)
  end
end
