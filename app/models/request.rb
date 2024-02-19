class Request < ApplicationRecord
  has_one_attached :image
  has_many :request_forms, dependent: :destroy
  belongs_to :employment_detail, optional: true
  belongs_to :staff
  has_many :request_tag_relations, dependent: :destroy
  has_many :tags, through: :request_tag_relations, dependent: :destroy
end
