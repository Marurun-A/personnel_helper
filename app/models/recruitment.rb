class Recruitment < ApplicationRecord
  has_one_attached :image
  has_many :recruitment_forms, dependent: :destroy
  belongs_to :employment_detail, optional: true
  belongs_to :company
end
