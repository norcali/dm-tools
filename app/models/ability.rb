class Ability < ApplicationRecord
	has_one :character


	def strength_bonus
		modifier(strength).to_f
	end

	def dexterity_bonus
		modifier(dexterity).to_f
	end

	def constitution_bonus
		modifier(constitution).to_f
	end

	def inteligence_bonus
		modifier(constitution).to_f
	end

	def wisdom_bonus
		modifier(wisdom).to_f
	end

	def charisma_bonus
		modifier(charisma).to_f
	end


	private

	def modifier(ability_score)
		$ability_scores[ability_score]
	end
end
