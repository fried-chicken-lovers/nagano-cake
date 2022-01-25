class Admin::OrderDetailsController < ApplicationController

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    if params[:order_detail][:making_status] == "making"
      @order_detail.order.status = "making"
      @order_detail.order.save
    elsif @order_detail.order.order_details.count == @order_detail.order.order_details.where(making_status: "finish").count
      @order_detail.order.status = "preparing_sending"
      @order_detail.order.save
    end
    redirect_to admin_order_path(@order_detail.order)
  end

  private
  def order_detail_params
    params.require(:order_detail).permit(:created_at, :updated_at, :price, :amount, :making_status, :item_id, :order_id)
  end

end
