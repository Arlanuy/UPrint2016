##
# This class represents a Student Devise model. A student has multiple 
# transactions, which are dependent on the student, and thus are destroyed upon 
# destroying the student.
#
# A student must have a unique name and student number, a valid and unique
# email, and an integer contact number.

class Student < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,  :confirmable

  validates :name, :student_number, :email, :contact_number, presence: true
  validates_uniqueness_of :name, :email, :student_number
  has_many :transactions, dependent: :destroy
end
