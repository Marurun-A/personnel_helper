class Recruitment < ApplicationRecord
  has_one_attached :image
  has_many :recruitment_forms, dependent: :destroy
  belongs_to :work_detail, optional: true
  belongs_to :company
  has_many :recruitment_tag_relations, dependent: :destroy
  has_many :tags, through: :recruitment_tag_relations, dependent: :destroy
end
