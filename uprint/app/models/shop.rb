class Shop < ActiveRecord::Base

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :shop_name, presence: true, uniqueness: true
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :location, presence: true
  validates :contact_number, presence: true, numericality: { only_integer: true }
end