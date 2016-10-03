##
# This class represents a Shop Devise model. A shop has multiple transactions,
# which are dependent on the shop, and thus are destroyed upon destroying the
# shop.
#
# A shop must have a unique name, a valid email, a location, and an integer
# contact number.

class Shop < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :transactions, dependent: :destroy
  has_one :transactions_count

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :shop_name, presence: true, uniqueness: true
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :location, presence: true
  validates :contact_number, presence: true, numericality: { only_integer: true }
end
