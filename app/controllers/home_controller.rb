class HomeController < ApplicationController

	def index
		@suggestions = Suggestion.most_recent.all
	end

	def login 
		@disable_nav = true
		@disable_header = true
	end
end
