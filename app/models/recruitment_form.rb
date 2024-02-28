class RecruitmentForm < ApplicationRecord
  has_one_attached :image
  belongs_to :recruitment
  belongs_to :staff, foreign_key: :staff_id
  belongs_to :company, foreign_key: :company_id
end
