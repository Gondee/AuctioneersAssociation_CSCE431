class SessionsController < ApplicationController
  
  def new
  end

  def create
     member = Member.find_by(Main_Email: params[:session][:Main_Email])
     if member && member.authenticate(params[:session][:password])
       log_in member
       redirect_to member
     else
       flash.now[:danger] = 'Invalid email/password combination'
       render 'new'
     end
  end

  def destroy
    log_out
    redirect_to root_url
  end
  
end
