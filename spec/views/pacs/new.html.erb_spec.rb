require 'rails_helper'

RSpec.describe "pacs/new", type: :view do
  before(:each) do
    assign(:pac, Pac.new(
      :PAC_Contribution => 1.5,
      :member => nil
    ))
  end

  it "renders new pac form" do
    render

    assert_select "form[action=?][method=?]", pacs_path, "post" do

      assert_select "input#pac_PAC_Contribution[name=?]", "pac[PAC_Contribution]"

      assert_select "input#pac_member_id[name=?]", "pac[member_id]"
    end
  end
end
