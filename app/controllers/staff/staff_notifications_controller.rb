class Staff::StaffNotificationsController < ApplicationController
  before_action :authenticate_staff!

  def update
    staff_notification = current_staff.staff_notifications.find(params[:id])
    staff_notification.update(read: true)
    case staff_notification.staff_notifiable_type
    when "Wook"
      redirect_to staff_staffs_my_page_path(staff_notification.staff_notifiable)
    else
      redirect_to staff_staffs_my_page_path(staff_notification.staff_notifiable.staff)
    end
  end
end
