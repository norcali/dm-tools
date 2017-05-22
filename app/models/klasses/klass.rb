class Klass < ApplicationRecord
	has_many :character_classes
	self.inheritance_column = 'klass_type'

	def name
		klass_type.titleize
	end

	def title
		klass_type.titleize
	end

	def magic_type
	end

	def spell_ability
	end
end
