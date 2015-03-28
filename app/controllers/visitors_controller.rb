class VisitorsController < ApplicationController
	before_action :redirect_if_user_signed_in
	def index
		render(:layout => false)
	end
	def redirect_if_user_signed_in
		if user_signed_in?
			unless current_user.admin?
				redirect_to '/dashboard'
			end
		end
	end
end
