class ContinueedusController < ApplicationController
  before_action :set_continueedu, only: [:show, :edit, :update, :destroy]

  # GET /continueedus
  # GET /continueedus.json
  def index
    if params[:format] == 'AllContinueedus' || params[:format] == nil
      @continueedus = Continueedu.all
    else
      @continueedus = Continueedu.where("member_id = #{params[:format]}")
    end
  end
  
  # GET /continueedus/1
  # GET /continueedus/1.json
  def show
  end

  # GET /continueedus/new
  def new
    @continueedu = Continueedu.new
  end

  # GET /continueedus/1/edit
  def edit
  end

  # POST /continueedus
  # POST /continueedus.json
  def create
    @continueedu = Continueedu.new(continueedu_params)

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
end
