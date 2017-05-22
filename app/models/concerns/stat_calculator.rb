module StatCalculator
	extend ActiveSupport::Concern

	def modifier(ability_score)
		$ability_scores[ability_score]
	end

	def get_score_bonus(score)
		if score >= 0
			return "+#{score.to_i}"
		else
			return "#{score.to_i}"
		end
	end

	def spell_slots_by_level(spell_level)
		slots = []
		spell_level.times do |level|
			level += 1
			unless level < 2
				if level.even?
					slots[-1] += 1
				elsif level <= 9
					slots[-1] += 1
				end
			end
			if level.odd?
				if level >= 7
					slots << 1
				else
					slots << 2
				end
			end
		end
		slots.each_with_index do |s, i|
			if s > 3
				slots[i] = 3 if i > 0
			end
		end

		return slots
	end
end