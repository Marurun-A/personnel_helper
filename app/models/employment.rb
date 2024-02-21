class Employment < ApplicationRecord

  has_one_attached :image
  has_many :employment_details, dependent: :destroy
  belongs_to :company

end
