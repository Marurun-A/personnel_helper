class Employment < ApplicationRecord

  has_one_attached :image
  has_many :employment_details, depnedent: :destroy
  belongs_to :company

end
