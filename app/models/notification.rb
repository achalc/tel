class Notification < ActiveRecord::Base
	belongs_to :user

	validates_presence_of :user_id

	scope :for_current_user, -> (current_user) { where(user_id: current_user.id)}
	
end
