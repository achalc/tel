class Notification < ActiveRecord::Base
	belongs_to :suggestion
	belongs_to :user

	validates_presence_of :user_id, :suggestion_id
	

end
