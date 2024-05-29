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
  # has_many :company_notifications, as: :company_notifiable, dependent: :destroy
  has_many :company_notifications, dependent: :destroy

  GUEST_COMPANY_EMAIL = "guest_company@example.com"

  def self.guest
    find_or_create_by!(email: GUEST_COMPANY_EMAIL) do |company|
      company.password = SecureRandom.urlsafe_base64
      company.first_name = "guest"
      company.last_name = "user"
      company.first_name_kana ="ゲスト"
      company.last_name_kana ="ユーザー"
      company.postal_code = "000-0000"
      company.address = "ゲストユーザー"
      company.telephone_number = "0000000000"
    end
  end

end
