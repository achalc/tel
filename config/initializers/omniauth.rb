provider :facebook, ENV['facebook_key'], ENV['facebook_secret'],
scope: 'public_profile', info_fields: 'id,name,link'