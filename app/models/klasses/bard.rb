class Bard < Klass
	def magic_type
		"full_caster"
	end

	def spell_ability
		"charisma"
	end

	def prepared_spells(score, level)
		4 + level
	end
end