class Tag < ApplicationRecord
  has_many :recruitment_tag_relations, dependent: :destroy
  has_many :recruitments, through: :recruitment_tag_relations, dependent: :destroy
  has_many :request_tag_relations, dependent: :destroy
  has_many :requests, through: :request_tag_relations, dependent: :destroy
end
