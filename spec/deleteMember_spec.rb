require 'spec_helper'

describe MembersController do
  describe "destroy" do
    it "Deletes a member", js: true do
      DatabaseCleaner.clean
      @member = Member.new(Last_Name: "Zhang", First_Name: "Alex", 
              Zip:"123456", Main_Phone: "1234567", Main_Email: "test@test.test",Date_Joined_TAA:"2000")
      visit member/path
      expect{
        within "#member/#{member.id}" do
          click_link 'Destroy'
        end
        alert = page.driver.browser.switch_to.alert
        alert.accept
      }.to change(Member,:count).by(-1)
      page.should have_content "redirect_to members_url"
      page.should have_content "Member was successfully destroyed"
      page.should_not have_content "Alex"
    end
  end
end