class HomeController < ApplicationController

	def index
		@suggestions = Suggestion.for_friends(current_user).most_recent.all
		@suggestions = Suggestion.most_recent.all if @suggestions.empty?
		# binding.pry
	end

	def login 
		@disable_nav = true
		@disable_header = true
	end
end
