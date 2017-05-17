class PlayerCharacter < Character
	def multiclassed?
		character_classes.count > 1
	end

	def total_level
		character_classes.map(&:level).sum()
	end

	def is_caster?
		character_classes.any?{|c| c.is_caster? }
	end

	def is_half_caster?
	end

	def title
		"#{name} #{character_classes.each{|f| f.display_name}}"
	end
end