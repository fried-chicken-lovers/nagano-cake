class Public::MembersController < ApplicationController
  before_action :authenticate_member!
  
  def show
    @member = current_member
  end

  def unsubscribe#退会画面
    @member = current_member
  end

  def unsubscribe#退会画面
    @member = current_member
  end

  def edit
    @member = current_member
  end

  def update
    @member = current_member
    if @member.update(member_params)
      redirect_to public_members_path(@member.id)
    else
      render "edit"
    end
  end

  private
   def member_params
      params.require(:member).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :email, :telephone_namber)
   end
end
