class Public::CartItemsController < ApplicationController

  def index
    #@cart_item = Cart.find(params[:id])
     @cart_items = Cart.all
  end

  def create
  end

  def destroy
  end

  def destroy_all
    #Book.destroy_all
    #current_user.books.destroy_all
  end

  def update
  end

  private
  def cart_params
    params.require(:cart).permit(:quantity)
  end

end
