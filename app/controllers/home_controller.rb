class HomeController < ApplicationController

	def index
		@suggestions = Suggestion.for_friends(current_user).most_recent.all
		@suggestions = Suggestion.most_recent.all if @suggestions.empty?
	end

	def login 
		@disable_nav = true
		@disable_header = true
	end

	def favorite
		favorite = Favorite.new(user_id: current_user.id, suggestion_id: params[:suggestion_id])
		favorite.save
		redirect_to :index
	end

	def unfavorite
		favorite = Favorite.find_by!(user_id: current_user.id, suggestion_id: params[:suggestion_id])
		favorite.delete
		redirect_to :index
	end
end
