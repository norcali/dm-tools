class Skill < ApplicationRecord
	belongs_to :character

	def has_proficiency?
	end

	def has_expertize?
	end
end