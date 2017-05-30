class Monk < Klass
	def magic_type
		"no_magic"
	end

	def prepared_spells(score, level)
		0
	end
end