class Link < ApplicationRecord
	def self.shorten
		numbers = (1..9).to_a
		alphabets = ('a'..'z').to_a
		alphanumeric = numbers + alphabets
   		short_url=(0..10).map{ alphanumeric.to_a[rand(alphanumeric.size)] }.join
	end
end
