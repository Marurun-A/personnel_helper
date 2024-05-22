module  Company::NotificationsHelper
  def notification_message(notification)
    case notification.notifiable_type
    when "Work"
      "募集に応募がありました"
    else
      ""
    end
  end
end