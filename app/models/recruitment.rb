class Recruitment < ApplicationRecord
  has_one_attached :image
  has_many :recruitment_forms, dependent: :destroy
  has_many :work_detail, dependent: :destroy
  # belongs_to :work_detail, optional: true
  belongs_to :company
  has_many :recruitment_tag_relations, dependent: :destroy
  has_many :tags, through: :recruitment_tag_relations, dependent: :destroy

  def save_tags(tags)
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    old_tags = current_tags - tags
    new_tags = tags - current_tags
    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(tag_name: old_name)
    end

    new_tags.each do |new_name|
      tag = Tag.find_or_create_by(tag_name: new_name)
      self.tags << tag
    end
  end


end

