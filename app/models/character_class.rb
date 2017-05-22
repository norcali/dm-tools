class CharacterClass < ApplicationRecord
	belongs_to :character
	belongs_to :klass

	def name
		unless try(:id).nil?
			"#{klass.name} level #{level}"
		end
	end

	def is_caster?
		klass.magic_type.include?('full_caster') || klass.magic_type.include?('special')
	end

	def is_half_caster?
		klass.magic_type.include?('half_caster')
	end
end
