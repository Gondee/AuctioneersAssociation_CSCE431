require 'spec_helper'
 
describe MembersController ,:type => :controller do
  # show ============
  it "assigns the requested member to @member" do
    member = FactoryGirl.create(:member)
    get :show, id: member
    assigns(:member).should eq(member)
  end
  
  it "renders the #show view" do
    get :show, id: FactoryGirl.create(:member)
    response.should render_template :show
  end
 end