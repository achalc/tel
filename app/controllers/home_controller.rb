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

	def favorite
		favorite = Favorite.new(user_id: current_user.id, suggestion_id: params[:suggestion_id])
		favorite.save
		if params[:user_profile_id]
			redirect_to user_path(User.find(params[:user_profile_id]))
		elsif params[:from_favorites]
			redirect_to :favorites
		else
			redirect_to :index
		end
	end

	def unfavorite
		favorite = Favorite.find_by!(user_id: current_user.id, suggestion_id: params[:suggestion_id])
		favorite.delete
		if params[:user_profile_id]
			redirect_to user_path(User.find(params[:user_profile_id]))
		elsif params[:from_favorites]
			redirect_to :favorites
		else
			redirect_to :index
		end
	end

	def search
	    @query = params[:query]
	    @users = User.search(@query)
	    @total_hits = @users.size
	end

end
