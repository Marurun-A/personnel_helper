class Work < ApplicationRecord

  has_one_attached :image
  has_many :work_details, dependent: :destroy
  belongs_to :staff
  belongs_to :company


  enum payment_method: { cash: 0, transfer: 1 }

end
