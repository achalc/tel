class User < ActiveRecord::Base
	mount_uploader :photo, PhotoUploader

	# relationships
	has_many :friends
	has_many :notifications
	has_many :suggestions
	has_many :favorites

	validates_presence_of :first_name, :last_name, :email, :password_digest
	# validates_presence_of :first_name, :last_name, :email, :password_digest

	def self.from_omniauth(auth)
	    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
	      user.provider = auth.provider
	      user.uid = auth.uid
	      user.name = auth.info.name
	      user.oauth_token = auth.credentials.token
	      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
	      user.save!
    end
  end

end
