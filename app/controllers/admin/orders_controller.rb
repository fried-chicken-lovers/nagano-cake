class Admin::OrdersController < ApplicationController

  before_action :authenticate_admin!

  def index

    @order_detail = OrderDetail.all
    @orders = Order.all
    @items = Item.all.page(params[:page]).per(5)

  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @amount = 0
    @order_details.each do |order_detail|
      @amount += order_detail.price * order_detail.amount
    end
  end

  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    if @order.update(order_params)
      if params[:order][:status] == "confirm_payment"
        @order_details.each do |order_detail|
          order_detail.making_status = "waiting"
          order_detail.save
        end
      end
    else
      render :show
    end
    redirect_to admin_order_path(@order)
  end


  private

  def order_params
    params.require(:order).permit(:status)

  end


end
