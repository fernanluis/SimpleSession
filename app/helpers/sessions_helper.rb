module SessionsHelper

  # The first method (log_in) accepts user and creates
  # a session for the user. Rails makes this easy for us.
  def log_in(user)
    #The rails way of creating a session is just using 'session[:user_id] = user.id'.
    #This will create a session with the user_id.
    session[:user_id] = user.id
  end

  # The current_user method will return the current user if there is one or if there is
  # a session present. That means if a user is logged in, the current user will be the that user.
  def current_user
    if session[:user_id]
      @current_user = User.find_by(id: session[:user_id])
    end
  end

  # The method just return true or false based on whether there is a current user or not.
  def logged_in?
    !current_user.nil?
  end

  # The log_out method will log out the user by deleting the session and setting the current_user to nil.
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  # The current_user? method accepts user and returns true if it's the same with the
  # current user or false otherwise. This can be useful to restrict a user from visiting other user's details.
  def current_user?(user)
    user == current_user
  end

# The next two methods are useful to redirect a non logged-in user
# to the first visited URL after logging in.

  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default) # url de reenvío
    session.delete(:forwarding_url) # url de reenvío
  end

  # forwarding_url : url de reenvío

  def store_location
    session[:forwarding_url] = request.original_url if request.get? # url de reenvío
  end
end
# ..
# Then we will import the session helper in the application controller. That means methods like logged_in? or current_user will be available to all controllers. Let's do that.
#application_controller.rb
