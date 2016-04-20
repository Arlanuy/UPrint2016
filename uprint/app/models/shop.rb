class Shop < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :transactions, dependent: :destroy

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :shop_name, presence: true, uniqueness: true
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :location, presence: true
  validates :contact_number, presence: true, numericality: { only_integer: true }
end
