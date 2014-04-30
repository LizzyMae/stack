class Story < ActiveRecord::Base

	has_many :comments

	validates :title, presence: true
	validates :description, presence: true
	validates :link, presence: true, uniqueness: true

end
