class Character < ApplicationRecord
	has_one :character_stat
	belongs_to :race
	belongs_to :sense
	belongs_to :background
	has_and_belongs_to_many :languages
	has_many :character_classes
	self.inheritance_column = 'character_type'


	def set_skill_proficiencies
	end

	def saving_throw_proficiencies
	end

	def set_armor_class
	end

	def set_speed(race)
	end

	def level_total
		character_classes.map(&:level).sum()
	end
end