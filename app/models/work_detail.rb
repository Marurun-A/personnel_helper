class WorkDetail < ApplicationRecord
  belongs_to :work
  belongs_to :recruitment, dependent: :destroy
  has_many :notifications, as: :notifiable, dependent: :destroy

end
