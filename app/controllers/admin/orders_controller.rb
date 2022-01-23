class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :shipping_cost, :total_payment, :status, :payment_method, :member_id)
  end
end