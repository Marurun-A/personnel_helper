class RecruitmentTagRelation < ApplicationRecord
  belongs_to :recruitment
  belongs_to :tag
end
