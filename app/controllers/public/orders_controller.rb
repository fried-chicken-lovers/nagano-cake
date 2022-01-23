class Public::OrdersController < ApplicationController


  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    if params[:order][:address_number] == "1"
        @order.name = current_member.last_name
        @order.adress = current_member.view_member_address

    elsif params[:order][:address_number] == "2"
        if Address.exists?(name: params[:order][:residence])
          @order.name = Address.find(params[:order][:residence]).lats_name
          @order.adress = Address.find(params[:order][:residence]).address
        else
          render :new
        end
    elsif params[:order][:address_number] == "3"
       address_new = current_member.addresses.new(address_params)
        if address_new.save
        else
          render :new
        end
    else
        redirect_to  public_orders_path
    end

    @cart_items = current_member.carts.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
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