class WorkDetail < ApplicationRecord

  has_many :requests, dependent: :destroy
  belongs_to :work
end
