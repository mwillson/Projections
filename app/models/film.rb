class Film < ActiveRecord::Base
  inherits_from :projection

  attr_accessible :description
  validates_presence_of :description

end
