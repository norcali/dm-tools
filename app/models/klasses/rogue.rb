class Rogue < Klass
	def magic_type
		if specialization.include?('arcane')
			"half_caster"
		else
			"no_magic"
		end
	end

	def spell_ability
		"intelligence"
	end

end