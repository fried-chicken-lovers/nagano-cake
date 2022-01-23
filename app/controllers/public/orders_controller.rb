class Public::OrdersController < ApplicationController

  def new
    @order = Order.all(params[:id])
    if @order.member(order_params)
      redirect_to new_public_order_path
    else
      render 'index'
    end
  end


 


  def confirm
  end

  def create
  end

  def thanx
  end

  def index
    @orders = current_member.orders

  end

  def show
  end
　　　　
  private
  def order_params
    params.require(:order).permit(:postal_code, :adress, :name, :payment_method, :total_payment, :status, :shipping_cost)
  end

end