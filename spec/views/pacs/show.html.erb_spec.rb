require 'rails_helper'

RSpec.describe "pacs/show", type: :view do
  before(:each) do
    @pac = assign(:pac, Pac.create!(
      :PAC_Contribution => 1.5,
      :member => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(//)
  end
end
