class RequestForm < ApplicationRecord
  has_one_attached :image
  belongs_to :request
  belongs_to :company, foreign_key: :company_id
  belongs_to :staff, foreign_key: :staff_id
end
