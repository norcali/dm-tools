class Klass < ApplicationRecord
	has_many :character_classes
	self.inheritance_column = 'klass_type'

	validates_uniqueness_of :specialization

	def name
		klass_type.titleize unless klass_type.nil?
	end

	def title
		klass_type.titleize
	end

	def magic_type
	end

	def spell_ability
	end
end
