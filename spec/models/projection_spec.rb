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

require 'spec_helper'

describe Projection do

  before { @projection = Projection.create(name: "Example Projection", subtype: "Film") }

  subject { @projection }
  
  it { should be_valid }
  it { should respond_to(:name) }

end
