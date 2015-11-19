class HomeController < ApplicationController

	def index
		
	end

	def login 
		@disable_nav = true
		@disable_header = true
	end
end
