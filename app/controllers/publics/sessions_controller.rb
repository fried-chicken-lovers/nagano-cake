# frozen_string_literal: true

class Publics::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected
protected

  def reject_member
  member = Member.find_by(email: params[:member][:email])
    if member
      if (member.valid_password?(params[:member][:password]) && (member.active_for_authentication? == false))
        redirect_to new_member_session_path
      end
    end
  end


  def after_sign_in_path_for(resource)
    public_members_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end
end
