class Klass < ApplicationRecord
	has_many :character_classes

	def name
		type
	end

	def title
		type
	end
end
