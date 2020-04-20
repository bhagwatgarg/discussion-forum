class ApplicationController < ActionController::Base

	before_action :check_authentication
	def check_authentication
		redirect_to login_path unless session[:user_id]
	end
end