class SavingThrow < ApplicationRecord
	has_one :character_stat

	def has_proficiency?(saving_throw)
	end
end