class Word < ApplicationRecord
	belongs_to :word
	
	def self.search(search)
		if search
			words = Word.where(regexp('^'+search,"name"))	
		else
			Word.all
		end
	end
end
