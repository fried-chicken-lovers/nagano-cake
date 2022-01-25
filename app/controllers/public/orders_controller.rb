class Public::OrdersController < ApplicationController
  before_action :authenticate_member!

  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    if params[:order][:address_number] == "1"
        @order.name = current_member.last_name + current_member.first_name
        @order.adress = current_member.address
        @order.postal_code = current_member.postal_code

    elsif params[:order][:address_number] == "2"
        if Address.exists?(id: params[:order][:residence])
          @address = Address.find(params[:order][:residence])
          @order.name = @address.name
          @order.adress = @address.residence
          @order.postal_code = @address.postal_code
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
    @amount = @total + 880
  end





  def create
    cart_items = current_member.carts.all
    @order = current_member.orders.new(order_params)
    @order.shipping_cost = 880

    if @order.save
      cart_items.each do |cart|
        order_detail = OrderDetail.new
        order_detail.item_id =  cart.item_id
        order_detail.order_id = @order.id
        order_detail.amount = cart.quantity
        order_detail.price = cart.item.price * 1.1
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