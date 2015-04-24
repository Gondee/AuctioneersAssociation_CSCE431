class DbioController < ApplicationController
  def index
  end
  
  # Import CSV table
  def import
    Member.import(params[:file])
    redirect_to members_url, notice: "Products imported."
  end
  
end
