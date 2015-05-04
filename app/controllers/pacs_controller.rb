class PacsController < ApplicationController
  before_action :set_pac,          only: [:show, :edit, :update, :destroy]
  before_action :set_member,       only: [:show, :edit, :update, :destroy]
  before_action :logged_in_member, only: [:show, :edit, :update]
  before_action :correct_member,   only: [:show]
  #before_action :admin_member,     only: [:index]
  before_action :master_admin,     only: [:destroy, :edit, :update]

  # GET /pacs
  # GET /pacs.json
  def index
    if params[:format] == nil && admin_member
      @pacs = Pac.all
    else
      if current_member_id == params[:format].to_i
        @pacs = Pac.where("member_id = #{params[:format]}")
      else
        redirect_to current_user
      end
    end
  end
  
  # GET /pacs/1
  # GET /pacs/1.json
  def show
  end

  # GET /pacs/new
  def new
    @pac = Pac.new
    @pac.member_id = params[:format]
    @pac.save!
  end

  # GET /pacs/1/edit
  def edit
  end

  # POST /pacs
  # POST /pacs.json
  def create
    @pac = Pac.new(pac_params)
    @pac.member_id = params[:format] #Creates the new payment as the active session user!
    respond_to do |format|
      if @pac.save
        format.html { redirect_to @pac, notice: 'Pac was successfully created.' }
        format.json { render :show, status: :created, location: @pac }
      else
        format.html { render :new }
        format.json { render json: @pac.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pacs/1
  # PATCH/PUT /pacs/1.json
  def update
    respond_to do |format|
      if @pac.update(pac_params)
        format.html { redirect_to @pac, notice: 'Pac was successfully updated.' }
        format.json { render :show, status: :ok, location: @pac }
      else
        format.html { render :edit }
        format.json { render json: @pac.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pacs/1
  # DELETE /pacs/1.json
  def destroy
    @pac.destroy
    respond_to do |format|
      format.html { redirect_to pacs_url, notice: 'Pac was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pac
      @pac = Pac.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pac_params
      params.require(:pac).permit(:PAC_Contribution, :member_id)
    end
    
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
