class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_member, only: [:show, :edit, :update, :destroy]
  before_action :correct_member,   only: [:show, :edit, :update]
  before_action :admin_member,     only: [:destroy, :index]
  # GET /members
  # GET /members.json
  def index
    @members = Member.all
    respond_to do |format|
    format.html
    format.csv { send_data @members.to_csv, :filename => "export_file.csv" }
  end
  end

  # GET /members/1
  # GET /members/1.json
  def show
    @member = Member.find(params[:id])
    #@payment = @member.payments.paginate(page: params[:page])
  end

  # GET /members/new
  def new
    @member = Member.new
  end

  # GET /members/1/edit
  def edit
  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(member_params)
    @member.admin = true
    respond_to do |format|
      if @member.save
        log_in @member
        format.html { redirect_to edit_member_path(@member), notice: 'Welcome to the Texas Auctioneers Association! Please Fill in your profile.' }
        format.json { render :show, status: :created, location: @member }
        #redirect_back_or member #may be unnessessary
      else
        format.html { render :new }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to @member, notice: 'Member was successfully updated.' }
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member.destroy
    respond_to do |format|
      format.html { redirect_to members_url, notice: 'Member was successfully Deleted.' }
      format.json { head :no_content }
    end
  end

  # Import CSV table
  def import
    Member.import(params[:file])
    redirect_to members_url, notice: "Products imported."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params.require(:member).permit(:Last_Name, :First_Name, :Company, :TX_License, :Street1, :City, :State, :Zip, :Main_Phone, :Main_Email, :Customer_Type, :Date_Joined_TAA, :Pymt_Type, :Pymt_Amt, :Pymt_Date, :Notes, :Added_to_WebBase, :PAC_Contribution, :Annual_Convention_CE_Hours, :Online_CE_Hours, :password, :password_confirmation)
    end
    
   # Before filters

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
      @mbmer = Member.find(params[:id])
      redirect_to(root_url) unless current_user?(@member) || current_user_admin?
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
        end
      end
    end
    
end
