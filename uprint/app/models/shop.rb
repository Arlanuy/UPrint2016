class Shop < ActiveRecord::Base

  validates :shop_name, presence: true, uniqueness: true
  validates :location, presence: true
  validates :email, presence: true
end
