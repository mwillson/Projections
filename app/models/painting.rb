# == Schema Information
#
# Table name: paintings
#
#  projection_id :integer          not null, primary key
#  description   :text
#

class Painting < ActiveRecord::Base
  inherits_from :projection

  attr_accessible :description
  validates_presence_of :description
end
