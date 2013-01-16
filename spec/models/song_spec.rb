require 'spec_helper'

describe Song do

  before { @song = Song.create(name: "example", description: "some description") }

  subject { @song }

  it { should be_valid }
  it { should respond_to(:name) }
  it { should respond_to(:description) }

end
