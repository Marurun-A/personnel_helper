class Employment < ApplicationRecord

  has_one_attached :image
  has_many :employment_details, dependent: :destroy
  belongs_to :company
  belongs_to :staff

  enum payment_method: { cash: 0, transfer: 1 }
  enum employment_status: { waiting_for_reply: 0, accepted: 1,  was_denied: 2 }

  def self.employment_statuses_i18n
      employment_statuses.keys.map do |status|
        [I18n.t("enums.employment.employment_status.#{status}"), status]
      end.to_h
  end

end
