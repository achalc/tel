class Suggestion < ActiveRecord::Base
	mount_uploader :photo, PhotoUploader

	# relationships
	belongs_to :user
	has_many :notifications

	# validations
	validates_presence_of :name, :description
	EXPERIENCE_TYPES = [['positive', 'positive'], ['okay', 'okay'], ['negative', 'negative']]
	validates :experience_type, presence: true, inclusion: { in: EXPERIENCE_TYPES.map{|a,b| b }}
	CATEGORIES_LIST = [['Restaurant', 'restaurant'],['Bar', 'bar'], ['Attraction', 'attraction'], ['Event/Festival', 'event/festival'], ['Nightlife', 'nightlife'], ['Shopping', 'shopping'], ['Museum', 'museum'], ['Other', 'other']]
	validates :category, inclusion: { in: CATEGORIES_LIST.map{|a,b| b}, message: "is not a valid category"}

	# scopes
	scope :most_recent, -> { order(created_at: :desc) }

end
