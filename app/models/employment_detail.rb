class EmploymentDetail < ApplicationRecord

  has_many :recuitments, dependent: :destroy
  belongs_to :employment

end
