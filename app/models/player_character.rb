class PlayerCharacter < Character
	has_many :character_classes

	def multiclassed?
		character_classes.count > 1
	end

	def total_level
		character_classes.map(&:level).sum()
	end

	def is_caster?
		character_classes.any?{|c| c.is_caster? }
	end
end