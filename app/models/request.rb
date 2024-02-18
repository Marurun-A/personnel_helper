class Request < ApplicationRecord
  has_one_attached :image
  has_many :request_forms, dependent: :destroy
  belongs_to :employment_detail, optional: true
  belongs_to :staff
end
