require 'rails_helper'

RSpec.describe "payments/show", type: :view do
  before(:each) do
    @payment = assign(:payment, Payment.create!(
      :Pymt_Type => "Pymt Type",
      :Pymt_Amt => 1,
      :member => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Pymt Type/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(//)
  end
end
