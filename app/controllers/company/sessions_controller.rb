class Company::SessionsController < Devise::SessionsController
  before_action :company_state, only: [:create]

  def after_sign_in_path_for(resource)
    company_companys_my_page_path
  end

  def after_sign_out_path_for(resource)
    company_root_path
  end

  def guest_sign_in
    company = Company.guest
    sign_in company
    redirect_to company_companys_my_page_path, notice: "guestcompanyでログインしました。"
  end

  private

  def company_state
      company = Company.find_by(email: params[:company][:email])
      return if company.nil?
      return unless company.valid_password?(params[:company][:password])

      if company.is_active == false
      flash[:alert] = "無効なアカウントです。"
      redirect_to new_company_session_path
      end
  end


end
