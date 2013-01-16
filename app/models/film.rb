# == Schema Information
#
# Table name: films
#
#  projection_id :integer          not null, primary key
#  description   :text
#

class Film < ActiveRecord::Base
  inherits_from :projection

  attr_accessible :description
  validates_presence_of :description

end
