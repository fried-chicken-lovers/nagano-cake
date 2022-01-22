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
    @member = current_member
    @order = order.all
  end
  
  def show
  end
  
end