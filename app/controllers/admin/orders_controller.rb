class Admin::OrdersController < ApplicationController
  def index
    @order_detail = OrderDetail.all
  end
  def show
    @order = Order.find(params[:id])
    @order_detail = @order.order_details
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :shipping_cost, :total_payment, :status, :payment_method, :member_id)

  end
end
