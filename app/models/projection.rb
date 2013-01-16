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
  acts_as_superclass

  attr_accessible :name, :subtype
  # validations in this class or subclasses??
  validates :name, :presence => true
end
