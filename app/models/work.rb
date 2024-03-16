class Work < ApplicationRecord

  has_one_attached :image
  has_many :work_details, dependent: :destroy
  belongs_to :staff
  belongs_to :company

  validates :payment_method, presence: true
  validates :work_name, presence: true
  validates :work_kana, presence: true
  validates :whereabouts, presence: true
  validates :date, presence: true
  validates :start_time, presence: true
  validates :finish_time, presence: true
  validates :hours, presence: true
  validates :transportation, presence: true
  validates :contact_address, presence: true
  validates :response_deadline, presence: true
  validates :introduction, presence: true


  enum payment_method: { cash: 0, transfer: 1 }
  enum work_status: { waiting_for_reply: 0, accepted: 1,  was_denied: 2 }

  def self.work_statuses_i18n
      work_statuses.keys.map do |status|
        [I18n.t("enums.work.work_status.#{status}"), status]
      end.to_h
  end

end
