class Staff::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number])
  end

  def after_sign_in_path_for(resource)
    staff_staffs_my_page_path
  end

  def after_sign_out_path_for(resource)
    staff_root_path
  end

end
