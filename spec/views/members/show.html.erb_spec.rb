require 'rails_helper'

RSpec.describe "members/show", type: :view do
  before(:each) do
    @member = assign(:member, Member.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Company/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Main Phone/)
    expect(rendered).to match(/Main Email/)
    expect(rendered).to match(/Customer Type/)
    expect(rendered).to match(/Pymt Type/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
  end
end
