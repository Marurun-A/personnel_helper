# frozen_string_literal: true

class Staff::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :staff_state, only: [:create]

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

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def after_sign_in_path_for(resource)
    staff_staffs_my_page_path
  end

  def after_sign_out_path_for(resource)
    staff_root_path
  end

  private
   def staff_state
      staff = Staff.find_by(email: params[:staff][:email])
      return if staff.nil?
      return unless staff.valid_password?(params[:staff][:password])

      if staff.is_active == false
      flash[:alert] = "無効なアカウントです。"
      redirect_to new_staff_session_path
      end
   end


end
