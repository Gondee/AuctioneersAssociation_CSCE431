require 'rails_helper'

RSpec.describe "pacs/index", type: :view do
  before(:each) do
    assign(:pacs, [
      Pac.create!(
        :PAC_Contribution => 1.5,
        :member => nil
      ),
      Pac.create!(
        :PAC_Contribution => 1.5,
        :member => nil
      )
    ])
  end

  it "renders a list of pacs" do
    render
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
