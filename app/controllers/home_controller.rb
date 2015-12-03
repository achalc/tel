class HomeController < ApplicationController

	def index
		@suggestions = Suggestion.for_friends(current_user).most_recent.all
		@suggestions = Suggestion.most_recent.all if @suggestions.empty?
	end

	def login 
		@disable_nav = true
		@disable_header = true
		@disable_searchbar = true
	end

	def search
	    @query = params[:query]
	    @users = User.search(@query)
	    @total_hits = @users.size
	end

end
