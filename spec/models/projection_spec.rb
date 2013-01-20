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

  let(:user) { FactoryGirl.create(:user) }
  before { @projection = user.projections.create(name: "Example Projection", 
                                                 category: "Film", 
                                                 description: "a description",
                                                 file: File.open('Gemfile')) }

  subject { @projection }
  
  it { should respond_to(:name) }
  it { should respond_to(:user_id) }
  it { should respond_to(:category) }
  it { should respond_to(:description) }

  it { should be_valid }
 
  describe "when user_id is not present" do
    before { @projection.user_id = nil }
    it {should_not be_valid }
  end

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Projection.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end

  describe "blank description" do
    before { @projection.description = "" }
    it { should_not be_valid }
  end

  describe "with description that is too long" do
    before { @projection.description = "a"*501 }
    it { should_not be_valid }
  end

  describe "with a file size too big" do
    before { @projection.file = File.open('six.mp3') }
    it { should_not be_valid }
  end

end
