class RequestForm < ApplicationRecord

  has_one_attached :image
  belongs_to :requests
  belongs_to :companys
  belongs_to :staffs

end
