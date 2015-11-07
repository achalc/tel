class Suggestion < ActiveRecord::Base
	belongs_to :user
	belongs_to :category
	has_many :photos
	has_many :notifications

	validates_presence_of :name, :description, :liked

end
