# == Schema Information
#
# Table name: projections
#
#  id         :integer          not null, primary key
#  subtype    :string(255)      not null
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Projection < ActiveRecord::Base

  attr_accessible :name, :category, :description, :file
  belongs_to :user

  validates :name, :presence => true
  validates :user_id, :presence => true
  validates :description, presence: true, length: { maximum: 1000 }
  validates :file, presence: true, file_size: { maximum: 5.megabytes.to_i }
  mount_uploader :file, FileUploader
  default_scope order: 'projections.created_at DESC'
end
