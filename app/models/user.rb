class User < ActiveRecord::Base
	has_many :friends
	has_many :notifications
	has_many :suggestions

	validates_presence_of :first_name, :last_name, :email, :password_digest
end
