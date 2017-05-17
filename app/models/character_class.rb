class CharacterClass < ApplicationRecord
	belongs_to :character
	belongs_to :klass

	def name
		unless try(:id).nil?
			"#{klass.name} level #{level}"
		end
	end
end
