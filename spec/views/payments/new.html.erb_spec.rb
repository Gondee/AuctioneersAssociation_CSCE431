require 'rails_helper'

RSpec.describe "payments/new", type: :view do
  before(:each) do
    assign(:payment, Payment.new(
      :Pymt_Type => "MyString",
      :Pymt_Amt => 1.5,
      :member => nil
    ))
  end

  it "renders new payment form" do
    render

    assert_select "form[action=?][method=?]", payments_path, "post" do

      assert_select "input#payment_Pymt_Type[name=?]", "payment[Pymt_Type]"

      assert_select "input#payment_Pymt_Amt[name=?]", "payment[Pymt_Amt]"

      assert_select "input#payment_member_id[name=?]", "payment[member_id]"
    end
  end
end
