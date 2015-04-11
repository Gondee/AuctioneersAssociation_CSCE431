require 'rails_helper'

RSpec.describe "payments/edit", type: :view do
  before(:each) do
    @payment = assign(:payment, Payment.create!(
      :Pymt_Type => "MyString",
      :Pymt_Amt => 1.5,
      :member => nil
    ))
  end

  it "renders the edit payment form" do
    render

    assert_select "form[action=?][method=?]", payment_path(@payment), "post" do

      assert_select "input#payment_Pymt_Type[name=?]", "payment[Pymt_Type]"

      assert_select "input#payment_Pymt_Amt[name=?]", "payment[Pymt_Amt]"

      assert_select "input#payment_member_id[name=?]", "payment[member_id]"
    end
  end
end
