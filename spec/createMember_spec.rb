require 'spec_helper'

describe "Create_Members" do
    
  it "should create a new instance of a user given valid attributes" do
    @member = Member.new(Last_Name: "Example_LastName", First_Name: "Example_FirstName", 
    Zip:"123456", Main_Phone: "1234567", Main_Email: "test@test.test")
    Member.create!(@member.attributes)
  end
  
  
end