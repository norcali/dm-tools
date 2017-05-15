class Skill < ApplicationRecord
	has_one :character

	def has_proficiency?
	end

	def has_expertize?
	end
end