require 'spec_helper'

describe Painting do
  
  before { @painting = Painting.create(name: "example", description: "some description") }

  subject { @painting }

  it { should be_valid }
  it { should respond_to(:name) }
  it { should respond_to(:description) }

end
