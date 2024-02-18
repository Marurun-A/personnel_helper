class RequestForm < ApplicationRecord
  has_one_attached :image
  belongs_to :request
  belongs_to :company

end
