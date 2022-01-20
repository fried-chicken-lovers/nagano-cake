class Admin::OrdersController < ApplicationController

  def index
    @order = Order.all
  end

  def update
  end

  private

  def order_params
      params.require(:order).permit(:status, :crated_at, :id, :member_id)
  end
end
