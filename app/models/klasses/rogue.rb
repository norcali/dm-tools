class Rogue < Klass
	def magic_type
		if specialization.include?('Arcane')
			"half_caster"
		else
			"no_magic"
		end
	end

	def spell_ability
		"intelligence"
	end

	def prepared_spells(score, level)
		level if specialization.include?('Arcane')
	end

end