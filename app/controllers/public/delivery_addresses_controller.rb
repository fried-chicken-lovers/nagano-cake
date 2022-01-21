class Public::DeliveryAddressesController < ApplicationController

  def index
    @delivery_address = Address.new
    @delivery_addresses = Address.all
  end

  def create
    @delivery_address = Address.new(address_params)
    @delivery_address.member_id = current_member.id
    @delivery_address.save
    redirect_to public_delivery_addresses_path(@delivery_address)
  end

  def destroy
    @delivery_address = Address.find(params[:id])
    @delivery_address.destroy
    redirect_to public_delivery_addresses_path(@delivery_address)
  end

  def edit
    @delivery_address = Address.find(params[:id])
  end

  def update
    @delivery_address = Address.find(params[:id])
    @delivery_address.update(address_params)
    redirect_to public_delivery_addresses_path(@delivery_address)
  end

  private
  def address_params
    params.require(:address).permit(:postal_code, :residence, :name)
  end

end