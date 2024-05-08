class Users::SessionsController < Devise::SessionsController
  def guest_sign_in
    company = Company.guest
    sign_in company
    redirect_to company_companys_my_page_path, notice: "guestcompanyでログインしました。"
  end
end