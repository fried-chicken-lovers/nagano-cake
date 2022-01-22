class Public::OrdersController < ApplicationController

  def new
    @order = Order.all(params[:id])
    if @order.member(order_params)
      redirect_to new_public_order_path
    else
      render 'index'
    end
  end


 private

  def order_params
    params.require(:order).permit(:name, :adress, :postal_code, :payment_method, :member_id)
  end

end