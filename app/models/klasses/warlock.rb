class Warlock < Klass
	def magic_type
		"special"
	end

	def spell_ability
		"charisma"
	end

	def prepared_spells(score, level)
		1 + level
	end
end