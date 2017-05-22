class AbilityItem < ApplicationRecord
	belongs_to :ability

	def score
		res = ability.score
		res += ability.character_stat.proficiency_bonus.to_i if proficiency
		res += ability.character_stat.proficiency_bonus.to_i if expertize
		return res
	end

	def bonus
		get_score_bonus(score)
	end
end
