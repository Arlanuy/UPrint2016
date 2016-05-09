class Transaction < ActiveRecord::Base
  belongs_to :shop
  belongs_to :student
  has_attached_file :file
  validates_attachment :file, presence: true, content_type: { content_type: %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }, size: { in: 0..10000.kilobytes }
  validates :number_pages, numericality: { greater_than_or_equal_to: 1 }
end
