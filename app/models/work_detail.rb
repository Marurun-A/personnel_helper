class WorkDetail < ApplicationRecord
  # has_many :recruitments, dependent: :destroy
  belongs_to :work
  belongs_to :recruitment
end
