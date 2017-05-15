class SavingThrow < ApplicationRecord
	has_one :character

	def has_proficiency?(saving_throw)
	end

end