class Request < ApplicationRecord
  has_one_attached :image
  has_many :request_forms, dependent: :destroy
  has_many :employment_detail, dependent: :destroy
  # belongs_to :employment_detail, optional: true
  belongs_to :staff
  has_many :request_tag_relations, dependent: :destroy
  has_many :tags, through: :request_tag_relations, dependent: :destroy

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
