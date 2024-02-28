class EmploymentDetail < ApplicationRecord

  belongs_to :request, dependent: :destroy
  belongs_to :employment

end
