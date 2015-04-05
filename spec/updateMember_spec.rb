require 'spec_helper'
 
describe MembersController do
    
    it "should change a members attributes from the default" do
        @member = Member.new(Last_Name: "Example_LastName", First_Name: "Example_FirstName", 
        Zip:"123456", Main_Phone: "1234567", Main_Email: "test@test.test",Date_Joined_TAA:"2000")
        Member.create!(@member.attributes)
        @member.save
        Member.update(@member.id, Last_Name:"Last_Name_Updated", First_Name:"First_Name_Updated",Company:"Company_Updated",TX_License:"000000",
        Street1:"Street_Updated",City:"City_Updated",State:"State_Upated",Zip:"000000",Main_Phone:"000000000",Main_Email:"email_updated@update.com",Customer_Type:"type_updated",
        Date_Joined_TAA:"2000",Pymt_Type:"Updated",Notes:"Notes_Updated",Added_to_WebBase:"Webbase_Updated",PAC_Contribution:"PAC_Updated",Annual_Convention_CE_Hours:"00",
        Online_CE_Hours:"00")
        end
    it "should update with only a partial argument list" do 
        @member = Member.new(Last_Name: "Example_LastName", First_Name: "Example_FirstName", 
        Zip:"123456", Main_Phone: "1234567", Main_Email: "test@test.test",Date_Joined_TAA:"2000")
        Member.create!(@member.attributes)
        @member.save
        Member.update(@member.id, Last_Name:"Last_Name_Updated", First_Name:"First_Name_Updated",Company:"Company_Updated",TX_License:"000000",
        Street1:"Street_Updated",City:"City_Updated",State:"State_Upated",Zip:"000000",Main_Phone:"000000000",Main_Email:"email_updated@update.com",Customer_Type:"type_updated",
        Date_Joined_TAA:"2000",Pymt_Type:"Updated")
    end
    
end
 #@newMemberParams = member_params.new(Last_Name:"Last_Name_Updated", First_Name:"First_Name_Updated",Company:"Company_Updated",TX_License:"000000",
        #Street1:"Street_Updated",City:"City_Updated",State:"State_Upated",Zip:"000000",Main_Phone:"000000000",Main_Email:"email_updated@update.com",Customer_Type:"type_updated",
        #Date_Joined_TAA:"00",Pymt_Type:"Updated",Notes:"Notes_Updated",Added_to_WebBase:"Webbase_Updated",PAC_Contribution:"PAC_Updated",Annual_Convention_CE_Hours:"00",
        #Online_CE_Hours:"00")
        