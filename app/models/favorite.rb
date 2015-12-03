class Favorite < ActiveRecord::Base

	# relationships
	belongs_to :user
	belongs_to :suggestion

	scope :my_favorites, -> (current_user) { where(user_id: current_user.id) }
	
end
