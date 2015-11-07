class Category < ActiveRecord::Base
	has_many :suggestions

	validates_presence_of :name
	
end
