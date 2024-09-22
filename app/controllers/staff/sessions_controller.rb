class Staff::SessionsController < Devise::SessionsController
  before_action :staff_state, only: [:create]

  def after_sign_in_path_for(resource)
    staff_staffs_my_page_path
  end

  def after_sign_out_path_for(resource)
    staff_root_path
  end

  def guest_sign_in
    staff = Staff.guest
    sign_in staff
    redirect_to staff_staffs_my_page_path, notice: "gueststaffでログインしました。"
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
