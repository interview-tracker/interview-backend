class Resume < ActiveRecord::Base
  belongs_to :user
  has_many :listings

  has_attached_file :document 

  validates_attachment_content_type :pdf, { content_type: ['application/pdf'] }
end
