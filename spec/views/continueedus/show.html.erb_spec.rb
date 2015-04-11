require 'rails_helper'

RSpec.describe "continueedus/show", type: :view do
  before(:each) do
    @continueedu = assign(:continueedu, Continueedu.create!(
      :Annual_Convention_CE_Hours => 1.5,
      :Online_CE_Hours => 1.5,
      :member => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(//)
  end
end
