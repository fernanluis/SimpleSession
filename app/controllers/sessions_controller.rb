class SessionsController < ApplicationController
# Not all the methods will be defined here. Some will be defined in the sessions helper.
# We will import the sessions helper in the applications controller which will be extended
# by all controllers automatically.

#  Some of the methods are implemented in the sessions helper.

  # The new method will be used for displaying the form.
  def new
  end

  # The create method will create the session.
  def create
    user = User.find(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_back_or user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  # The destroy method will destroy or remove the session when the user logs out.
  def destroy
    log_out
    redirect_to root_url
  end

end
