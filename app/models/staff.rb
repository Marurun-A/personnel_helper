class Staff < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image
  has_many :requests, dependent: :destroy
  has_many :works, dependent: :destroy
  has_many :recruitment_forms, foreign_key: :staff_id, dependent: :destroy
  has_many :employments, dependent: :destroy
  has_many :request_forms, foreign_key: :company_id, dependent: :destroy
  # has_many :staff_notifications, as: :staff_notifiable, dependent: :destroy
  has_many :staff_notifications, dependent: :destroy

  GUEST_STAFF_EMAIL = "guest_staff@example.com"

  def self.guest
    find_or_create_by!(email: GUEST_STAFF_EMAIL) do |staff|
      staff.password = SecureRandom.urlsafe_base64
      staff.first_name = "guest"
      staff.last_name = "user"
      staff.first_name_kana ="ゲスト"
      staff.last_name_kana ="ユーザー"
      staff.postal_code = "000-0000"
      staff.address = "ゲストユーザー"
      staff.telephone_number = "0000000000"
    end
  end
end
