class Shop < ActiveRecord::Base

  validates :shop_name, presence: true, uniqueness: true
  validates :email, presence: true
  validates :location, presence: true
end