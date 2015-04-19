module SessionsHelper
    # Logs in the given user.
  def log_in(member)
    session[:member_id] = member.id
  end
  # Returns the current logged-in user (if any).
  def current_user
    @current_member ||= Member.find_by(id: session[:member_id])
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
  
end
