class Skill < ApplicationRecord
	has_one :character

	def has_proficiency?(skill)
	end

	def has_expertize?(skill)
	end

	def profiencies
	end

	def expertizes
	end
end