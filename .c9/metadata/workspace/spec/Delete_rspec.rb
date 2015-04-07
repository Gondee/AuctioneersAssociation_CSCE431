{"changed":true,"filter":false,"title":"Delete_rspec.rb","tooltip":"/spec/Delete_rspec.rb","value":"require 'spec_helper'\n\ndescribe MembersController do\n  describe \"destroy\" do\n    it \"Deletes a member\", js: true do\n      DatabaseCleaner.clean\n      contact = Factory(:member, first_name: \"Aaron\", last_name: \"Sumner\")\n      visit members_path\n      expect{\n        within \"#member/#{member.id}\" do\n          click_link 'Destroy'\n        end\n        alert = page.driver.browser.switch_to.alert\n        alert.accept\n      }.to change(Member,:count).by(-1)\n      page.should have_content \"Member was successfully destroyed\"\n      page.should_not have_content \"Aaron Sumner\"\n    end\n  end\nend","undoManager":{"mark":-1,"position":1,"stack":[[{"group":"doc","deltas":[{"start":{"row":0,"column":0},"end":{"row":19,"column":3},"action":"insert","lines":["require 'spec_helper'","","describe \"Members\" do","  describe \"destroy\" do","    it \"Deletes a member\", js: true do","      DatabaseCleaner.clean","      contact = Factory(:member, first_name: \"Aaron\", last_name: \"Sumner\")","      visit members_path","      expect{","        within \"#member/#{member.id}\" do","          click_link 'Destroy'","        end","        alert = page.driver.browser.switch_to.alert","        alert.accept","      }.to change(Member,:count).by(-1)","      page.should have_content \"Member was successfully destroyed\"","      page.should_not have_content \"Aaron Sumner\"","    end","  end","end"]}]}],[{"group":"doc","deltas":[{"start":{"row":2,"column":9},"end":{"row":2,"column":18},"action":"remove","lines":["\"Members\""]},{"start":{"row":2,"column":9},"end":{"row":2,"column":26},"action":"insert","lines":["MembersController"]}]}]]},"ace":{"folds":[],"scrolltop":0,"scrollleft":0,"selection":{"start":{"row":2,"column":26},"end":{"row":2,"column":26},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":0},"timestamp":1428402351873}