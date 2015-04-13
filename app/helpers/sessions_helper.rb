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
    !current_member.nil?
  end
  
  # Logs out the current user.
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  
end
