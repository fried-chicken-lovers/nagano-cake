class Admin::MembersController < ApplicationController
   before_action :authenticate_user!
   def index
      @members = Member.all.page(params[:page]).per(10)
   end

   def show
      @member = Member.find(params[:id])
   end

   def edit
   end

   def update
   end

   private
   def member_params
      params.require(:member).permit(:last_name, :first_name, :last_name_kana, :first_name_kana)
   end
end
