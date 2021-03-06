require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "signup page" do
    before { visit signup_path }
    let(:submit) { "Create my account" }

    it { should have_selector('h2', text: 'Sign up') }
    it { should have_selector('title', text: 'Sign up') }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name", with: "Example"
        fill_in "Email", with: "user@example.com"
        fill_in "Password", with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end
      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by_email('user@example.com') }
        it { should have_selector('title', text: user.name) }
        it { should have_selector('div.alert.alert-success', text: 'Welcome') }
        it { should have_link('Sign out') }
      end
    end
  end # Signup page

  describe "show page" do
    let(:user) { FactoryGirl.create(:user) }
    let!(:p1) { FactoryGirl.create(:projection, user: user) }
    let!(:p2) { FactoryGirl.create(:projection, user: user) }  
    before { visit user_path(user) }

    it { should have_selector('h2', text: user.name) }
    it { should have_selector('title', text: user.name) }
    it { should have_link('Create a Projection', href: new_projection_path) }

    describe "projections" do
      it { should have_link( p1.name, href: projection_path(p1.id) ) }
      it { should have_link( p2.name, href: projection_path(p2.id) ) }
      it { should have_content(user.projections.count) }
    end

  end # Show page

  describe "edit page" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      sign_in user
      visit edit_user_path(user)
    end

    it { should have_selector('h2', text: "Update your profile") }
    it { should have_selector('title', text: "Edit user") }
    it { should have_link('change', href: 'http://gravatar.com/emails') }

    describe "with invalid information" do
      before { click_button "Save changes" }
      it { should have_content('error') }
    end

    describe "with valid information" do
      let(:new_name) { "New Name" }
      let(:new_email) { "new@example.com" }
      before do
        fill_in "Name", with: new_name
        fill_in "Email", with: new_email
        fill_in "Password", with: user.password
        fill_in "Confirmation", with: user.password
        click_button "Save changes"
      end
      it { should have_selector('title', text: new_name) }
      it { should have_selector('div.alert.alert-success') }
      it { should have_link('Sign out', href: signout_path) }
      specify { user.reload.name.should == new_name }
      specify { user.reload.email.should == new_email }
    end
  end # Edit page

  describe "index" do

    let(:user) { FactoryGirl.create(:user) }

    before(:each)do
      sign_in user
      visit users_path
    end
    
    it { should have_selector('title', text: 'All users') }
    it { should have_selector('h2', text: 'All users') }
    
    describe "pagination" do
      before(:all) { 30.times { FactoryGirl.create(:user) } }
      after(:all) { User.delete_all }
      
      it { should have_selector('div.pagination') }
      it "should list each user" do
        User.paginate(page: 1).each do |user|
          page.should have_selector('li', text: user.name)
        end
      end
    end

  end # index page

end
