class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  helper_method :current_user

	def current_user
		if @current_user == nil
			# Get from the Rails' session stuff the ID that was stored
			# when someone logged in.  (Or nil if nobody is logged in.)
			user_id_from_cookies = session[:user_id]
			# Using any found ID, try to find a collection with one user that matches that ID
			all_users_with_this_id = User.where(id: user_id_from_cookies)
			# From the collection of all users who match this ID, just grab the first one
			# or if there aren't any, then turn this into nil.
			@current_user = all_users_with_this_id.first
		end
		# Return any current_user that we know about, or nil if there
		# was nobody logged in
		@current_user
	end
end
