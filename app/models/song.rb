# == Schema Information
#
# Table name: songs
#
#  projection_id :integer          not null, primary key
#  description   :text
#

class Song < ActiveRecord::Base
  inherits_from :projection

  attr_accessible :description
  validates_presence_of :description
end
