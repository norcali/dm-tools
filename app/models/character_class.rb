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

	def prepared_spells
		if is_caster? && !['sorcerer, warlock'].include?(klass.name)
			return (level + character.character_stat.get_ability(klass.spell_ability).score.to_i).to_i
		elsif is_half_caster? && !['sorcerer, warlock'].include?(klass.name)
			return ((level/2).to_i + character.character_stat.get_ability(klass.spell_ability).score.to_i).to_i
		elsif ['sorcerer', 'warlock'].include?(klass.name)
			return level + 1
		end
	end

	def total_spell_level
		if is_caster?
			level
		elsif is_half_caster?
			(level/2).to_i
		else
			0
		end
	end
end
