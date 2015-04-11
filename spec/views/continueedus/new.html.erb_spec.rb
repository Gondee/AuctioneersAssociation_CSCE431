require 'rails_helper'

RSpec.describe "continueedus/new", type: :view do
  before(:each) do
    assign(:continueedu, Continueedu.new(
      :Annual_Convention_CE_Hours => 1.5,
      :Online_CE_Hours => 1.5,
      :member => nil
    ))
  end

  it "renders new continueedu form" do
    render

    assert_select "form[action=?][method=?]", continueedus_path, "post" do

      assert_select "input#continueedu_Annual_Convention_CE_Hours[name=?]", "continueedu[Annual_Convention_CE_Hours]"

      assert_select "input#continueedu_Online_CE_Hours[name=?]", "continueedu[Online_CE_Hours]"

      assert_select "input#continueedu_member_id[name=?]", "continueedu[member_id]"
    end
  end
end
