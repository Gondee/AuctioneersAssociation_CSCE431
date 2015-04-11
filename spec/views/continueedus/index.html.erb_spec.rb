require 'rails_helper'

RSpec.describe "continueedus/index", type: :view do
  before(:each) do
    assign(:continueedus, [
      Continueedu.create!(
        :Annual_Convention_CE_Hours => 1.5,
        :Online_CE_Hours => 1.5,
        :member => nil
      ),
      Continueedu.create!(
        :Annual_Convention_CE_Hours => 1.5,
        :Online_CE_Hours => 1.5,
        :member => nil
      )
    ])
  end

  it "renders a list of continueedus" do
    render
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
