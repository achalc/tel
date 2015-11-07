class Photo < ActiveRecord::Base
	belongs_to :suggestion

	validates_presence_of :filename
end
