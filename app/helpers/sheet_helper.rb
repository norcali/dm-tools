module SheetHelper
	def modifier(ability_score)
		$ability_scores[ability_score]
	end

	def get_score_bonus(score)
		if score >= 0
			return "+#{score.to_i}"
		else
			return "-#{score.to_i}"
		end
	end

	def spell_dc(value)
	end
end