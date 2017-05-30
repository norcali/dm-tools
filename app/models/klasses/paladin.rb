class Paladin < Klass

	def magic_type
		"half_caster"
	end

	def spell_ability
		"charisma"
	end

	def prepared_spells(score, level)
		score + level.div(2)
	end
end