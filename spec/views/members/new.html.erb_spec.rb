require 'rails_helper'

RSpec.describe "members/new", type: :view do
  before(:each) do
    assign(:member, Member.new(
      :Last_Name => "MyString",
      :First_Name => "MyString",
      :Company => "MyString",
      :TX_License => 1,
      :Street1 => "MyText",
      :City => "MyString",
      :State => "MyString",
      :Zip => 1,
      :Main_Phone => "MyString",
      :Main_Email => "MyString",
      :Customer_Type => "MyString",
      :Pymt_Type => "MyString",
      :Pymt_Amt => 1.5,
      :Notes => "MyText",
      :Added_to_WebBase => false,
      :PAC_Contribution => 1.5,
      :Annual_Convention_CE_Hours => 1.5,
      :Online_CE_Hours => 1.5
    ))
  end

  it "renders new member form" do
    render

    assert_select "form[action=?][method=?]", members_path, "post" do

      assert_select "input#member_Last_Name[name=?]", "member[Last_Name]"

      assert_select "input#member_First_Name[name=?]", "member[First_Name]"

      assert_select "input#member_Company[name=?]", "member[Company]"

      assert_select "input#member_TX_License[name=?]", "member[TX_License]"

      assert_select "textarea#member_Street1[name=?]", "member[Street1]"

      assert_select "input#member_City[name=?]", "member[City]"

      assert_select "input#member_State[name=?]", "member[State]"

      assert_select "input#member_Zip[name=?]", "member[Zip]"

      assert_select "input#member_Main_Phone[name=?]", "member[Main_Phone]"

      assert_select "input#member_Main_Email[name=?]", "member[Main_Email]"

      assert_select "input#member_Customer_Type[name=?]", "member[Customer_Type]"

      assert_select "input#member_Pymt_Type[name=?]", "member[Pymt_Type]"

      assert_select "input#member_Pymt_Amt[name=?]", "member[Pymt_Amt]"

      assert_select "textarea#member_Notes[name=?]", "member[Notes]"

      assert_select "input#member_Added_to_WebBase[name=?]", "member[Added_to_WebBase]"

      assert_select "input#member_PAC_Contribution[name=?]", "member[PAC_Contribution]"

      assert_select "input#member_Annual_Convention_CE_Hours[name=?]", "member[Annual_Convention_CE_Hours]"

      assert_select "input#member_Online_CE_Hours[name=?]", "member[Online_CE_Hours]"
    end
  end
end
