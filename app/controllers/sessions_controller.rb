class SessionsController < ApplicationController
  
  def new
  end

  def create
     member = Member.find_by(Main_Email: params[:session][:Main_Email])
     @memberid = Member.find_by(Main_Email: params[:session][:Main_Email])
     if member && member.authenticate(params[:session][:password])
       #If log in as admin, redirect to administrating members page. Otherwise, redirect to user info page 
       log_in member
        if !admin?
          if(active?)
            redirect_to member
          else
            #Not active member 
            redirect_to new_payment_path(member)  #Don't have a payment system setup
          end 
        else
         redirect_to members_url
        end
     else
       flash.now[:danger] = 'Invalid email/password combination'
       render 'new'
     end
  end

  def destroy
    log_out
    redirect_to root_url
  end
  
  def active?
    payment = @memberid.payments.where(Pymt_Date: (Time.now.midnight - 364.day)..Time.now.midnight)   #Payment.where(created_at: (Time.now.midnight - 1.day)..Time.now.midnight).find
    #payment = Hash.new()
    #payment['q'] = 1
    if payment.empty?
      false
    else
      true
    end
  end
  
  def admin?
    @memberid.admin
  end
  
end
