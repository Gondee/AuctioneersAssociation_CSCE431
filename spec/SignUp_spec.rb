require 'spec_helper'

describe "Create_Members", :type => :controller do
  
  include Rails.application.routes.url_helpers
  
  it "has a valid factory" do
    FactoryGirl.create(:member).should be_valid
  end
    
  it "should create a new instance of a user given valid attributes" do
    @member = FactoryGirl.build(:member)
    Member.create!(@member.attributes)
  end
  
  it "is invalid without a firstname" do
    FactoryGirl.build(:member, First_Name: nil).should_not be_valid
  end
  
  it "is invalid without a lastname" do
    FactoryGirl.build(:member, Last_Name: nil).should_not be_valid
  end
  
  it "is invalid without a minimum 5-dig Zip " do
    FactoryGirl.build(:member, Zip: 1234).should_not be_valid
  end
  
  it "Sign up a new user and go to detailed member info page" do
      visit root_path
      expect{
        click_link 'Sign up now!'
        fill_in 'First name', with: "John"
        fill_in 'Last name', with: "Smith"
        fill_in 'Main email', with: "test@test.com"
        fill_in 'Password', with: "123456"
        fill_in 'Confirmation', with: "123456"
        click_button "Create my account"
      }.to change(Member,:count).by(1)
      page.should have_content "Member was successfully created."
      page.should have_content "Last name: Smith"
      page.should have_content "First name: John"
      page.should have_content "Main email: test@test.com"
    end
    
    it "Can't Sign up a new membber and displays the error" do
        visit root_path
      expect{
        click_link 'Sign up now!'
        fill_in 'First name', with: "John"
        fill_in 'Last name', with: "Smith"
        fill_in 'Main email', with: "test@test.com"
        fill_in 'Password', with: "123456"
        fill_in 'Confirmation', with: "1234567"
        click_button "Create my account"
      }.to change(Member,:count).by(0)
      page.should have_content "Password confirmation doesn't match Password"
    end
    
    
  
end