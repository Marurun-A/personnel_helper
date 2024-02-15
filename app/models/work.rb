class Work < ApplicationRecord

  has_one_attached :image
  has_many :work_details, depnedent: :destroy
  belongs_to :staff

end
