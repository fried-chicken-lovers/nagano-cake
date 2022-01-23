class Public::CartItemsController < ApplicationController

  def index
    #@cart_item = Cart.find(params[:id])
     @cart_items = Cart.all
  end

  def create
    @cart_item = Cart.new(cart_params)
    @cart_item.member_id = current_member.id
    @cart_item.save
    redirect_to public_cart_items_path(@cart_item)
  end

  def destroy
    @cart_item = Cart.find(params[:id])
    @cart_item.destroy
    redirect_to public_cart_items_path(@cart_item)
  end

  #def destroy_all
    #Book.destroy_all
    #current_user.books.destroy_all
  #end

  def update
  end

  private
  def cart_params
    params.require(:cart).permit(:item_id, :quantity)
  end

end
