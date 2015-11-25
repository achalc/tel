class User < ActiveRecord::Base
	mount_uploader :photo, PhotoUploader

	# relationships
	has_many :friends
	has_many :notifications
	has_many :suggestions
	has_many :favorites

  	# scopes 
  	scope :alphabetical, -> {order('name') }

	# validates_presence_of :first_name, :last_name, :email, :password_digest

  def self.koala(auth)
    access_token = auth['token']
    facebook = Koala::Facebook::API.new(access_token)
    facebook.get_object("me?fields=name,picture,friends")
  end

  # TO DO: create friendships with others who use the app

  def self.login(koala_user, auth)
  	where(uid: koala_user['id']).first_or_initialize.tap do |user|
  		user.provider = 'facebook'
	  	user.uid = koala_user['id']
	  	user.name = koala_user['name']
	  	user.profile_picture = koala_user['picture']['data']['url']
	  	user.oauth_token = auth.credentials.token
  		user.oauth_expires_at = Time.at(auth.credentials.expires_at)
	 	user.save!
  	end
  end

end
