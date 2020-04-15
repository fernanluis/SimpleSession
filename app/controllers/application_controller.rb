class ApplicationController < ActionController::Base
  include SessionsHelper

  # The private method will be used to store location and redirect to the login form.
  # After the user logs in, the user will be redirected back to the URL they tried to visit.
  private

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = 'Please log in.'
      redirect_to login_url
    end
  end
  
end
