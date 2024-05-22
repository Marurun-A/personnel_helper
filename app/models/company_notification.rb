class CompanyNotification < ApplicationRecord
  belongs_to :company
  belongs_to :company_notifiable, polymorphic: true
end
