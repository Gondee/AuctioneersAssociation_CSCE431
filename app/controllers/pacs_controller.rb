class PacsController < ApplicationController
  before_action :set_pac, only: [:show, :edit, :update, :destroy]

  # GET /pacs
  # GET /pacs.json
  def index
    @pacs = Pac.all
  end

  # GET /pacs/1
  # GET /pacs/1.json
  def show
  end

  # GET /pacs/new
  def new
    @pac = Pac.new
  end

  # GET /pacs/1/edit
  def edit
  end

  # POST /pacs
  # POST /pacs.json
  def create
    @pac = Pac.new(pac_params)

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

  # Import CSV table
  def import
    Pac.import(params[:file])
    redirect_to pacs_url, notice: "Products imported."
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
end
