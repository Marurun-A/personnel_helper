class Company::CompanyNotificationsController < ApplicationController
   before_action :authenticate_company!

  def update
    company_notification = current_company.company_notifications.find(params[:id])
    company_notification.update(read: true)
    case company_notification.company_notifiable_type
    when "Employment"
      redirect_to company_companys_my_page_path(company_notification.company_notifiable)
    else
      redirect_to company_companys_my_page_path(company_notification.company_notifiable.company)
    end
  end
end
