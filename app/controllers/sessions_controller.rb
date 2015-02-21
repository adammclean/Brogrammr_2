class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		# Log the user in and redirect to the user's show page.
  		log_in user
      remember user
  		# TERNIARY OPERATOR
      # if_this_is_a_true_value ? then_the_result_is_this : else_it_is_this
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
  		redirect_back_or user
  	else
  		flash.now[:danger] = 'Invalid email/password combination'
  		render 'new'
  end
end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
