class Student < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,  :confirmable

  validates :name, :student_number, :email, :contact_number, presence: true
  validates_uniqueness_of :name, :email, :student_number
  has_many :transactions, dependent: :destroy
end
