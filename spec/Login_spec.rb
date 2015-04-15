require 'spec_helper'

describe "Login" ,:type => :controller do
    
  before do
    visit root_path
      expect{
        click_link 'Sign up now!'
        fill_in 'First name', with: "John"
        fill_in 'Last name', with: "Smith"
        fill_in 'Main email', with: "test@test.com"
        fill_in 'Password', with: "123456"
        fill_in 'Confirmation', with: "123456"
        click_button "Create my account"
      }.to change(Member,:count).by(1)
  end
  
  it "log in with right email and password" do
      visit root_path
      click_link 'Log in'
      fill_in 'Main email', with: "test@test.com"
      fill_in 'Password', with: "123456"
      click_button "Log in"
      response.should render_template :show
  end
  
end