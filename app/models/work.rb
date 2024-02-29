class Work < ApplicationRecord

  has_one_attached :image
  has_many :work_details, dependent: :destroy
  belongs_to :staff
  belongs_to :company


  enum payment_method: { cash: 0, transfer: 1 }
  enum employment_status: { waiting_for_reply: 0, accepted: 1,  was_denied: 2 }

  def self.work_statuses_i18n
      work_statuses.keys.map do |status|
        [I18n.t("enums.work.work_status.#{status}"), status]
      end.to_h
  end

end
