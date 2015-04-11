require 'rails_helper'

RSpec.describe "pacs/edit", type: :view do
  before(:each) do
    @pac = assign(:pac, Pac.create!(
      :PAC_Contribution => 1.5,
      :member => nil
    ))
  end

  it "renders the edit pac form" do
    render

    assert_select "form[action=?][method=?]", pac_path(@pac), "post" do

      assert_select "input#pac_PAC_Contribution[name=?]", "pac[PAC_Contribution]"

      assert_select "input#pac_member_id[name=?]", "pac[member_id]"
    end
  end
end
