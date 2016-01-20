class Rating < ActiveRecord::Base

	has_many :topics
	has_many :posts

	enum severity: [ :PG, :PG13, :R ] 

	#why isnt severity showing up in display as a method????

	def self.update_rating(rating)
		Rating.find_or_create_by(severity: rating.to_i)

		# return Rating.none if rating_string.blank?

		#need to select a Rating.severtity which is essentially a number from an array?
		#then need to save severity

		#this below likely needs to be edited
		# rating_string.split(",").map do |rating|
		# 	Rating.find_or_create_by(name: rating.strip)	
		# end
	end


end
