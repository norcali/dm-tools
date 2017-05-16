class Klass < ApplicationRecord
	has_many :character_classes
	has_and_belongs_to_many :features

	def name
		type
	end

	def title
		type
	end
end
