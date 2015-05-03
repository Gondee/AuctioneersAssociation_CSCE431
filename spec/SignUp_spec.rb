require 'spec_helper'

describe "Create_Members", :type => :controller do
  
  before(:each) do
    visit root_path
  end
  
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
    
    
  
end