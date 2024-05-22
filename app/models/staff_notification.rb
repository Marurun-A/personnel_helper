class StaffNotification < ApplicationRecord
  belongs_to :staff
  belongs_to :staff_notifiable, polymorphic: true
end
