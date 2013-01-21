require 'spec_helper'

describe "projection pages" do

  subject { page }

  describe "show page" do
    let!(:user) { FactoryGirl.create(:user) }
    let!(:proj) { FactoryGirl.create(:projection, user: user) }
    before do
      sign_in user
      visit projection_path(proj.id)    
    end

    it { should have_selector('title', text: proj.name) }
    it { should have_selector('h2', text: proj.name) }
    it { should have_selector('p', text: proj.description) }        
  end

  describe "index page" do
    let!(:user) { FactoryGirl.create(:user) }
    before do
      sign_in user
      visit projections_path
    end

    Projection.all.each do |proj|
      page.should have_selector("li##{proj.id}", text: proj.name)
    end
  end

end
