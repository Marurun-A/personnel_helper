module  Company::NotificationsHelper
  def h_company_notification_message(notification)
    case notification.company_notifiable_type
    when "Employment"
      "依頼のステータスが更新されました"
    when "Work"
      "募集に応募がありました"
    else
      ""
    end
  end
end