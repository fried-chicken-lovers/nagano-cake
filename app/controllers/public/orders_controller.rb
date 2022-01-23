class Public::OrdersController < ApplicationController


  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new

  end

  def create
    cart_items = current_member.cart.all
    @order = current_member.orders.new(order_params)

    if @order.save
      cart_items.each do |cart|
        order_detail = OrderDetails.new
        order_detail.item_id =  cart.item_id
        order_detail.order_id = @order.id
        order_detail.order_quantity = cart.quantity
        order_detail.order_price = cart.item.price
        order_detail.save
      end
      redirect_to public_orders_thanx_path
      cart_items.destroy_all
    end

  end

  def thanx
  end

  def index
    @orders = current_member.orders

  end

  def show
  end

  def order_params
    params.require(:order).permit(:postal_code, :adress, :name, :payment_method, :total_payment, :status, :shipping_cost)
  end
end