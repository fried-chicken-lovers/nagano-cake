class Public::MembersController < ApplicationController
  def show
    @member = current_member
  end

  def quit
  end

  def out
  end

  def edit
  end

  def update
  end

  private
   def member_params
      params.require(:member).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :email, :telephone_namber)
   end
end
