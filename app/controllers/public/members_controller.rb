class Public::MembersController < ApplicationController
  def show
    @member = current_member
  end

  def unsubscribe#退会画面
    @member = current_member
  end

  def withdraw#退会機能
    @member = current_member
    @member.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  def edit#編集画面
    @member = current_member
  end

  def update#編集機能
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
