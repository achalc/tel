class User < ActiveRecord::Base
	mount_uploader :photo, PhotoUploader

	# relationships
	has_many :friends
	has_many :notifications
	has_many :suggestions
	has_many :favorites

	# validations
	validates_presence_of :first_name, :last_name, :email, :password_digest

end
