class Projection < ActiveRecord::Base
  acts_as_superclass

  attr_accessible :name, :subtype
  # validations in this class or subclasses??
  validates :name, :presence => true
end
