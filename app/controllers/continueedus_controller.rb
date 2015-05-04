class ContinueedusController < ApplicationController
  before_action :set_continueedu,  only: [:show, :edit, :update, :destroy]
  before_action :set_member,       only: [:show, :edit, :update, :destroy]
  before_action :logged_in_member, only: [:show, :edit, :update]
  before_action :correct_member,   only: [:show]
  #before_action :admin_member,     only: [:index]
  before_action :master_admin,     only: [:destroy, :edit, :update]

  # GET /continueedus
  # GET /continueedus.json
  def index
    if params[:format] == nil && admin_member
      @continueedus = Continueedu.all
    else
      if current_member_id == params[:format].to_i
        @continueedus = Continueedu.where("member_id = #{params[:format]}")
      else
        redirect_to current_user
      end
    end
  end
  # GET /continueedus/1
  # GET /continueedus/1.json
  def show
  end

  # GET /continueedus/new
  def new
    @continueedu = Continueedu.new
    @continueedu.member_id = params[:format]
    @continueedu.save!
  end

  # GET /continueedus/1/edit
  def edit
  end

  # POST /continueedus
  # POST /continueedus.json
  def create
    @continueedu = Continueedu.new(continueedu_params)
    @continueedu.member_id = params[:format]
    respond_to do |format|
      if @continueedu.save
        format.html { redirect_to @continueedu, notice: 'Continueedu was successfully created.' }
        format.json { render :show, status: :created, location: @continueedu }
      else
        format.html { render :new }
        format.json { render json: @continueedu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /continueedus/1
  # PATCH/PUT /continueedus/1.json
  def update
    respond_to do |format|
      if @continueedu.update(continueedu_params)
        format.html { redirect_to @continueedu, notice: 'Continueedu was successfully updated.' }
        format.json { render :show, status: :ok, location: @continueedu }
      else
        format.html { render :edit }
        format.json { render json: @continueedu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /continueedus/1
  # DELETE /continueedus/1.json
  def destroy
    @continueedu.destroy
    respond_to do |format|
      format.html { redirect_to continueedus_url, notice: 'Continueedu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # Import CSV table
  def import
    Continueedu.import(params[:file])
    redirect_to continueedus_url, notice: "Products imported."
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_continueedu
      @continueedu = Continueedu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def continueedu_params
      params.require(:continueedu).permit(:Annual_Convention_CE_Hours, :Online_CE_Hours, :member_id)
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
