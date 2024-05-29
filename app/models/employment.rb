class Employment < ApplicationRecord

  has_one_attached :image
  has_many :employment_details, dependent: :destroy
  belongs_to :company
  belongs_to :staff
  has_many :company_notifications, as: :company_notifiable, dependent: :destroy

  validates :payment_method, presence: true
  validates :employment_name, presence: true
  validates :employment_kana, presence: true
  validates :place_of_employment, presence: true
  validates :date, presence: true
  validates :start_time, presence: true
  validates :finish_time, presence: true
  validates :hours, presence: true
  validates :hourly_wage, presence: true
  validates :contact_address, presence: true
  validates :response_deadline, presence: true
  validates :introduction, presence: true

  enum payment_method: { cash: 0, transfer: 1 }
  enum employment_status: { waiting_for_reply: 0, accepted: 1,  was_denied: 2 }

  def self.employment_statuses_i18n
      employment_statuses.keys.map do |status|
        [I18n.t("enums.employment.employment_status.#{status}"), status]
      end.to_h
  end

end
