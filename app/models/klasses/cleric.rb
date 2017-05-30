class Cleric < Klass
	def magic_type
		"full_caster"
	end

	def spell_ability
		"wisdom"
	end

	def prepared_spells(score, level)
		score + level
	end
end