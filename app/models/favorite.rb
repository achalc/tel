class Favorite < ActiveRecord::Base

	# relationships
	belongs_to :user
	belongs_to :suggestion


end
