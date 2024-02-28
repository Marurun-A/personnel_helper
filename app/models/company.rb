class Company < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image
  has_many :recruitments, dependent: :destroy
  has_many :employments, dependent: :destroy
  has_many :request_forms, foreign_key: :company_id, dependent: :destroy
  has_many :works, dependent: :destroy
  has_many :recruitment_forms, foreign_key: :company_id, dependent: :destroy
end
