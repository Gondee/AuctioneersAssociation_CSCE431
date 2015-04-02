require 'test_helper'

class MembersControllerTest < ActionController::TestCase
  setup do
    @member = members(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:members)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create member" do
    assert_difference('Member.count') do
      post :create, member: { Added_to_WebBase: @member.Added_to_WebBase, Annual_Convention_CE_Hours: @member.Annual_Convention_CE_Hours, City: @member.City, Company: @member.Company, Customer_Type: @member.Customer_Type, Date_Joined_TAA: @member.Date_Joined_TAA, First_Name: @member.First_Name, Last_Name: @member.Last_Name, Main_Email: @member.Main_Email, Main_Phone: @member.Main_Phone, Notes: @member.Notes, Online_CE_Hours: @member.Online_CE_Hours, PAC_Contribution: @member.PAC_Contribution, Pymt_Amt: @member.Pymt_Amt, Pymt_Date: @member.Pymt_Date, Pymt_Type: @member.Pymt_Type, State: @member.State, Street1: @member.Street1, TX_License: @member.TX_License, Zip: @member.Zip }
    end

    assert_redirected_to member_path(assigns(:member))
  end

  test "should show member" do
    get :show, id: @member
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @member
    assert_response :success
  end

  test "should update member" do
    patch :update, id: @member, member: { Added_to_WebBase: @member.Added_to_WebBase, Annual_Convention_CE_Hours: @member.Annual_Convention_CE_Hours, City: @member.City, Company: @member.Company, Customer_Type: @member.Customer_Type, Date_Joined_TAA: @member.Date_Joined_TAA, First_Name: @member.First_Name, Last_Name: @member.Last_Name, Main_Email: @member.Main_Email, Main_Phone: @member.Main_Phone, Notes: @member.Notes, Online_CE_Hours: @member.Online_CE_Hours, PAC_Contribution: @member.PAC_Contribution, Pymt_Amt: @member.Pymt_Amt, Pymt_Date: @member.Pymt_Date, Pymt_Type: @member.Pymt_Type, State: @member.State, Street1: @member.Street1, TX_License: @member.TX_License, Zip: @member.Zip }
    assert_redirected_to member_path(assigns(:member))
  end

  test "should destroy member" do
    assert_difference('Member.count', -1) do
      delete :destroy, id: @member
    end

    assert_redirected_to members_path
  end
end
