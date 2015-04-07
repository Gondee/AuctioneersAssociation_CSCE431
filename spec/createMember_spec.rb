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
  
  it "Adds a new contact and displays the results" do
      visit members_path
      expect{
        click_link 'New Member'
        fill_in 'First name', with: "John"
        fill_in 'Last name', with: "Smith"
        fill_in 'Zip', with: "12345"
        fill_in 'Company', with: "TestCop"
        click_button "Create Member"
      }.to change(Member,:count).by(1)
      page.should have_content "Member was successfully created."
      page.should have_content "Last name: Smith"
      page.should have_content "First name: John"
      page.should have_content "Zip: 12345"
      page.should have_content "Company: TestCop"
    end
    
    it "Can't Adds a new contact and displays the error" do
      visit members_path
      expect{
        click_link 'New Member'
        fill_in 'First name', with: nil
        fill_in 'Last name', with: "Smith"
        fill_in 'Zip', with: "12345"
        fill_in 'Company', with: "TestCop"
        click_button "Create Member"
      }.to change(Member,:count).by(0)
      page.should have_content "error prohibited this member from being saved"
      page.should have_content "First name can't be blank"
    end
    
    
  
end