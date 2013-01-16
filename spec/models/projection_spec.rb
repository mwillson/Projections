require 'spec_helper'

describe Projection do

  before { @projection = Projection.create(name: "Example Projection", subtype: "Film") }

  subject { @projection }
  
  it { should be_valid }
  it { should respond_to(:name) }

end
