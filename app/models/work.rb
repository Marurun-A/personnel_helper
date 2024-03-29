class Work < ApplicationRecord

  has_one_attached :image
  has_many :work_details, dependent: :destroy
  belongs_to :staff
  belongs_to :company

  with_options presence: true do
    validates :payment_method
    validates :work_name
    validates :work_kana
    validates :whereabouts
    validates :date
    validates :start_time
    validates :finish_time
    validates :hours
    validates :transportation
    validates :contact_address
    validates :response_deadline
    validates :introduction
  end


  enum payment_method: { cash: 0, transfer: 1 }
  enum work_status: { waiting_for_reply: 0, accepted: 1,  was_denied: 2 }

  def self.work_statuses_i18n
      work_statuses.keys.map do |status|
        [I18n.t("enums.work.work_status.#{status}"), status]
      end.to_h
  end

end
