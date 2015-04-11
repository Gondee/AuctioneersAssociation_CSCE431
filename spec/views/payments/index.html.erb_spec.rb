require 'rails_helper'

RSpec.describe "payments/index", type: :view do
  before(:each) do
    assign(:payments, [
      Payment.create!(
        :Pymt_Type => "Pymt Type",
        :Pymt_Amt => 1.5,
        :member => nil
      ),
      Payment.create!(
        :Pymt_Type => "Pymt Type",
        :Pymt_Amt => 1.5,
        :member => nil
      )
    ])
  end

  it "renders a list of payments" do
    render
    assert_select "tr>td", :text => "Pymt Type".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
