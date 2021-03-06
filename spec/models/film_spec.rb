# == Schema Information
#
# Table name: films
#
#  projection_id :integer          not null, primary key
#  description   :text
#

require 'spec_helper'

describe Film do

  before { @film = Film.create(name: "example", description: "some description") }

  subject { @film }

  it { should be_valid }
  it { should respond_to(:name) }
  it { should respond_to(:description) }

end
