class PaymentsController < ApplicationController
  before_action :set_payment, only: [:show, :edit, :update, :destroy]
  before_action :set_member,       only: [:show, :edit, :update, :destroy]
  before_action :logged_in_member, only: [:show, :edit, :update]
  before_action :correct_member,   only: [:show]
  before_action :master_admin,     only: [:destroy, :edit, :update]
  
  helper_method :current_user
  # GET /payments
  # GET /payments.json
  def index
    if params[:format] == nil && admin_member
      @payments = Payment.all
    else
      if current_member_id == params[:format].to_i
        @payments = Payment.where("member_id = #{params[:format]}")
      else
        redirect_to current_user
      end
    end
  end

  # GET /payments/1
  # GET /payments/1.json
  def show
  end
  
  def show_pym_this_user
    #@payment = current_user.Payment #I believe this is what we want -JK
  end

  # GET /payments/new
  def new
    @payment = Payment.new
    if current_user_master_admin?
      @payment.member_id = params[:format]
      @payment.save!
    end
    #@payment = Payment.new :member_id => current_user.id #Depending on the amount, this will be used to auto fill. -JK
    
  end

  # GET /payments/1/edit
  def edit
  end

  # POST /payments
  # POST /payments.json
  def create
    @payment = Payment.new(payment_params)
    #Defining if the User or an Admin is editing the user. 
    if current_user_admin?
      @payment.member_id = params[:format]
    else 
      @payment.member_id = current_user.id #Creates the new payment as the active session user!
      @payment.save!
    end
    
    respond_to do |format|
      if @payment.save
        format.html { redirect_to @payment, notice: 'Payment was successfully created.' }
        format.json { render :show, status: :created, location: @payment }
      else
        format.html { render :new }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payments/1
  # PATCH/PUT /payments/1.json
  def update
    respond_to do |format|
      if @payment.update(payment_params)
        format.html { redirect_to @payment, notice: 'Payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @payment }
      else
        format.html { render :edit }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1
  # DELETE /payments/1.json
  def destroy
    @payment.destroy
    respond_to do |format|
      format.html { redirect_to current_user , notice: 'Payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  # Import CSV table
  def import
    Payment.import(params[:file])
    redirect_to payments_url, notice: "Products imported."
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_params
      params.require(:payment).permit(:Pymt_Type, :Pymt_Amt, :Pymt_Date)  
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
