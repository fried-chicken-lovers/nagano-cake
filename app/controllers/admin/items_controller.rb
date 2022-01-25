class Admin::ItemsController < ApplicationController

  before_action :authenticate_admin!

  def index
    @items = Item.all
    @items = Item.all.page(params[:page]).per(2)
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_item_path(@item.id)
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_items_path
    else
      render "edit"
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :price, :image, :is_deleted, :genre_id)
  end
end
