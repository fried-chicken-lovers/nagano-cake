class Public::CartItemsController < ApplicationController

  def index
     @cart_items = Cart.all

     @sum = 0
     @cart_items.each do |cart_item|
      @subtotal = (Item.find(cart_item.item_id).price * 1.1 * cart_item.quantity).to_i
      @sum += @subtotal
     end

  end

  def create
    @cart_item = Cart.new(cart_params)
    @cart_item.member_id = current_member.id

    @cart_item = current_member.carts.build(cart_params)
    @cart_items = current_member.carts.all
    @cart_items.each do |cart_item|
     if cart_item.item_id == @cart_item.item_id
      new_quantity = cart_item.quantity + @cart_item.quantity
      cart_item.update_attribute(:quantity, new_quantity)
      @cart_item.delete
     end
    end

    @cart_item.save
    redirect_to public_cart_items_path(@cart_item)
  end

  def destroy
    @cart_item = Cart.find(params[:id])
    @cart_item.destroy
    redirect_to public_cart_items_path(@cart_item)
  end

  def destroy_all
    current_member.carts.destroy_all
    redirect_to public_cart_items_path
  end

  def update
    @cart_item = Cart.find(params[:id])
    @cart_item.update(cart_params)
    redirect_to public_cart_items_path(@cart_item)
  end

  private
  def cart_params
    params.require(:cart).permit(:item_id, :quantity)
  end

end
