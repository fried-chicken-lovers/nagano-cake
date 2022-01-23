class Admin::OrderDetailsController < ApplicationController

  def update
    @order_detail = Order_detail.find(params[:id])
    if @order_detail.update(order_detail_params)
      redirect_to admin_order_path
    else render 'index'
    end
  end

  private
  def order_details(params)
    params.require(:order_details).permit(:created_at, :updated_at, :price, :amount, :making_status, :item_id, :order_id)
  end

end
