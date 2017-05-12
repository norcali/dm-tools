class SavingThrow < ApplicationRecord
	belongs_to :character

	def has_proficiency?(saving_throw)
	end

end