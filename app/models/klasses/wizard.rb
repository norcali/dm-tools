class Wizard < Klass
	def magic_type
		"full_caster"
	end

	def spell_ability
		"intelligence"
	end

	def prepared_spells(score, level)
		score + level
	end
end