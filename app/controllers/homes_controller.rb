class HomesController < ApplicationController
	def index
		if user_signed_in?
		redirect_to :controller => 'categories', :action => 'index'
	end

	end
end
