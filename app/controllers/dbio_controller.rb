class DbioController < ApplicationController
  before_action :set_member,       only: [:show, :edit, :update, :destroy]
  before_action :logged_in_member, only: [:index]
  before_action :master_admin,     only: [:index]
  
  def index
  end
  
  # Import CSV table
  def import
    Member.import(params[:file])
    redirect_to members_url, notice: "Products imported."
  end
  
  private
  # Before filters
    
    def set_member
      @member = current_user
    end

    # Confirms a logged-in user.
    def logged_in_member
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
    # Confirms the correct user.
    def correct_member
      #@member = Member.find(params[:id])
      if current_user?(@member) || current_user_admin?  #in this case admin level is ok as well 
        true #Correct, was creating confusion 
      else
        flash[:notice] = "Unauthorized. Please Contact Admin"
        redirect_to members_url
      end
    end
    #Checks if admin is a master admin, in which case they have full control
    def master_admin
      if !current_user_master_admin?
        flash[:notice] = "Unauthorized. Please Contact Admin"
        redirect_to login_url
      end
    end
    
    # Confirms an admin user.
    def admin_member
      if !logged_in?
        flash[:notice] = "Please log in first."
        redirect_to login_url
      else
        if !current_user_admin?
          flash[:notice] = "Please log in as Admin."
          redirect_to login_url
        else 
          true
        end
      end
    end
  
end
