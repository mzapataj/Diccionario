class Word < ApplicationRecord
	belongs_to :word

  validates :name, presence: true, uniqueness: true

	def self.search(search)
		if search
				#words = Word.where(name: search)
				words = Word.where("name ~* ?", '^'+search)
		else
			Word.all
		end
	end

end
