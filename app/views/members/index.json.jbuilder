json.array!(@members) do |member|
  json.extract! member, :id, :Last_Name, :First_Name, :Company, :TX_License, :Street1, :City, :State, :Zip, :Main_Phone, :Main_Email, :Customer_Type, :Date_Joined_TAA, :Pymt_Type, :Pymt_Amt, :Pymt_Date, :Notes, :Added_to_WebBase, :PAC_Contribution, :Annual_Convention_CE_Hours, :Online_CE_Hours
  json.url member_url(member, format: :json)
end
