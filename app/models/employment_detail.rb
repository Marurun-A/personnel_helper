class EmploymentDetail < ApplicationRecord

  has_many :requests, dependent: :destroy
  belongs_to :employment

end
