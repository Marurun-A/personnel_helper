class RecruitmentForm < ApplicationRecord
  belongs_to :recruitment
  belongs_to :staff, foreign_key: :staff_id
end
