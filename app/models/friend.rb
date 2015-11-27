class Friend < ActiveRecord::Base
	validates_presence_of :user_id_1, :user_id_2
	validate :check_existing_friendship

	def self.are_friends(user_id_1, user_id_2)
		!Friend.where(user_id_1: user_id_1, user_id_2: user_id_2).blank?
	end

	private

	def check_existing_friendship
		if !Friend.where(user_id_1: user_id_1, user_id_2: user_id_2).blank? 
			errors.add(:user_id_2, 'is already your friend')
		end
	end

end
