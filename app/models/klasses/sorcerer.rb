class Sorcerer < Klass
	def magic_type
		"full_caster"
	end

	def spell_ability
		"charisma"
	end

	def prepared_spells(score, level)
		1 + level
	end
end