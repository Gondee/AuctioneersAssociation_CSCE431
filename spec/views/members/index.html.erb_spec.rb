require 'rails_helper'

RSpec.describe "members/index", type: :view do
  before(:each) do
    assign(:members, [
      Member.create!(
        :Last_Name => "Last Name",
        :First_Name => "First Name",
        :Company => "Company",
        :TX_License => 1,
        :Street1 => "MyText",
        :City => "City",
        :State => "State",
        :Zip => 2,
        :Main_Phone => "Main Phone",
        :Main_Email => "Main Email",
        :Customer_Type => "Customer Type",
        :Pymt_Type => "Pymt Type",
        :Pymt_Amt => 1.5,
        :Notes => "MyText",
        :Added_to_WebBase => false,
        :PAC_Contribution => 1.5,
        :Annual_Convention_CE_Hours => 1.5,
        :Online_CE_Hours => 1.5
      ),
      Member.create!(
        :Last_Name => "Last Name",
        :First_Name => "First Name",
        :Company => "Company",
        :TX_License => 1,
        :Street1 => "MyText",
        :City => "City",
        :State => "State",
        :Zip => 2,
        :Main_Phone => "Main Phone",
        :Main_Email => "Main Email",
        :Customer_Type => "Customer Type",
        :Pymt_Type => "Pymt Type",
        :Pymt_Amt => 1.5,
        :Notes => "MyText",
        :Added_to_WebBase => false,
        :PAC_Contribution => 1.5,
        :Annual_Convention_CE_Hours => 1.5,
        :Online_CE_Hours => 1.5
      )
    ])
  end

  it "renders a list of members" do
    render
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Company".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Main Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Main Email".to_s, :count => 2
    assert_select "tr>td", :text => "Customer Type".to_s, :count => 2
    assert_select "tr>td", :text => "Pymt Type".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
