class AbilityItem < ApplicationRecord
	belongs_to :ability
	after_initialize :set_defaults, unless: :persisted?
	validate :uniqueness

	def score
		res = ability.score
		res += ability.character_stat.proficiency_bonus.to_i if proficiency
		res += ability.character_stat.proficiency_bonus.to_i if expertize
		return res
	end

	def bonus
		get_score_bonus(score)
	end

	private

	def set_defaults
		proficiency ||= false
		expertize ||= false
	end

	def uniqueness
		unless AbilityItem.select{|f| f.ability_id == ability_id && f.name == name}.empty?
			errors.add(:name, "la skill existe")
		end
	end
end
