require 'spec_helper'

describe "Create_Members" do
  
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
  
  #it "returns a contact's full name as a string" do
   #FactoryGirl.build(:member, First_Name: "John", Last_Name: "Doe").FullName.should == "John Doe"
  #end
  #it "is invalid without a valid Email address" do
   # before { 
    # FactoryGirl.build(:member)
    # @member.email = "WrongEmail@WrongEmail " 
    #}
    #it { should_not be_valid }
 # end
  
  #it "is invalid without a Zip contains anything except numbers " do
    #FactoryGirl.build(:member, Zip: abcd)).should_not be_valid
   # FactoryGirl.build(:member, Zip: :$1234)).should_not be_valid
  #end
  
  
end