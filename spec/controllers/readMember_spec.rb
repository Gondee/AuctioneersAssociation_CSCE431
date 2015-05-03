require 'rails_helper'

describe MembersController ,:type => :controller do
  # show ============
  it "assigns the requested member to @member" do
    member = FactoryGirl.create(:member)
    get :show, id: member
    assigns(:member).should eq(member)
  end
end

