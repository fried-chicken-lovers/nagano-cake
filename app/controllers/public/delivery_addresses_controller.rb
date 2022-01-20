class Public::DeliveryAddressesController < ApplicationController

  def index
    @delivery_address = Address.new
    @delivery_addresses = Address.all
  end

  def create
    @delivery_address = Address.new(address_params)
    @delivery_address.save
    redirect_to public_delivery_addresses_path(@address)
  end

  def destroy
  end

  private
  def address_params
    params.permit(:postal_code, :residence, :name)
  end

end