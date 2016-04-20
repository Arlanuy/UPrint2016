class Transaction < ActiveRecord::Base
  belongs_to :shop
	belongs_to :student
  has_attached_file :file
  validates_attachment :file, content_type: { content_type: %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }, size: { in: 0..10000.kilobytes }
end
