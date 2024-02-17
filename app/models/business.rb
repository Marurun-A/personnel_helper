class Business < ApplicationRecord

  has_many :business_tag_relations, dependent: :destroy
  has_many :tags, through: :business_tag_relations, dependent: :destroy

end

#idの付与が必要

