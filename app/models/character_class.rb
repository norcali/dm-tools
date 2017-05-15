class CharacterClass < ApplicationRecord
	belongs_to :character
	belongs_to :klass

	def is_caster?
		klass.is_caster?
	end

	def is_half_caster?
		klass.is_half_caster?
	end

	def no_spells?
		klass.no_spells?
	end

	def name
		"#{klass.name} level #{level}"
	end
end
