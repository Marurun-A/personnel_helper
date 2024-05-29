module  Staff::NotificationsHelper
  def h_staff_notification_message(notification)
    case notification.staff_notifiable_type
    when "Employment"
      "募集に応募がありました"
    when "Work"
      "依頼のステータスが更新されました"
    else
      ""
    end
  end
end