class Tag < ApplicationRecord

  has_many :business_tag_relations, dependent: :destroy
  has_many :businesss, through: :business_tag_relations, dependent: :destroy

end
