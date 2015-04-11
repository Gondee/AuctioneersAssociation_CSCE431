require 'rails_helper'

RSpec.describe "continueedus/edit", type: :view do
  before(:each) do
    @continueedu = assign(:continueedu, Continueedu.create!(
      :Annual_Convention_CE_Hours => 1.5,
      :Online_CE_Hours => 1.5,
      :member => nil
    ))
  end

  it "renders the edit continueedu form" do
    render

    assert_select "form[action=?][method=?]", continueedu_path(@continueedu), "post" do

      assert_select "input#continueedu_Annual_Convention_CE_Hours[name=?]", "continueedu[Annual_Convention_CE_Hours]"

      assert_select "input#continueedu_Online_CE_Hours[name=?]", "continueedu[Online_CE_Hours]"

      assert_select "input#continueedu_member_id[name=?]", "continueedu[member_id]"
    end
  end
end
