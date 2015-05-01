module SessionsHelper
    # Logs in the given user.
  def log_in(member)
    session[:member_id] = member.id
  end
  # Returns the current logged-in user (if any).
  def current_user
    #@current_member ||= Member.find_by(id: session[:member_id])
    if (member_id = session[:member_id])
      @current_user ||= Member.find_by(id: member_id)
    elsif (member_id = cookies.signed[:member_id])
      member = Member.find_by(id: member_id)
      if member && member.authenticated?(:remember, cookies[:remember_token])
        log_in member
        @current_user = member
      end
    end
  end
  #returns the current member ID
  def current_member_id 
   current_user.member_id
  end 
   # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?  #Reference function above. Never got its name changed to member, leaving for dependency sake
  end
  
  # Redirects to stored location (or to the default).
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end
  # Stores the URL trying to be accessed.
  def store_location
    session[:forwarding_url] = request.url if request.get?
  end
  
  # Logs out the current user.
  def log_out
    session.delete(:member_id)
    @current_member = nil
  end
  
  # Returns true if the given member is the current member.
  def current_user?(member)
    member == current_user
  end
  
  def current_user_admin?
    if current_user.admin >=1
      true
    else
      false
    end
  end
  
  def current_user_master_admin?
    if current_user.admin == 2
      true
    else
      false
    end
  end
  
end
