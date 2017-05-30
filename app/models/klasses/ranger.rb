class Ranger < Klass
	def magic_type
		"half_caster"
	end

	def spell_ability
		"wisdom"
	end

	def prepared_spells(score, level)
		score + level.div(2)
	end
end