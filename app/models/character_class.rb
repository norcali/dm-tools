class CharacterClass < ApplicationRecord
	belongs_to :player_character

	def is_caster?
	end
end
