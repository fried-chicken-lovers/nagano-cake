class Public::OrdersController < ApplicationController


  def new
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

  def order_params
    params.require(:order).permit(:postal_code, :adress, :name, :payment_method, :total_payment, :status, :shipping_cost)
  end
end