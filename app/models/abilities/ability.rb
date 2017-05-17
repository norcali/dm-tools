class Ability < ApplicationRecord
	has_many :ability_items
	belongs_to :character_stat
	self.inheritance_column = 'ability_type'

	def name
		if try(:id).nil?
			"#{ability_type}"
		else
			"#{character_stat.character.name}'s #{ability_type}"
		end
	end

	def get_skills
		st = ability_items.find_by_name('saving throw')
		ability_items - st
	end

	def get_skill(name)
		ability_items.find_by_name(name)
	end

	def get_skill_bonus(name)
		skill = get_skill(name)
		calculate_bonus(skill)
	end

	def calculate_bonus(item)
		res = score
		res += character_stat.proficiency_bonus if item.proficiency
		res += character_stat.proficiency_bonus if item.expertize
		return res
	end
end
