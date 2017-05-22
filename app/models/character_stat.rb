class CharacterStat < ApplicationRecord
	has_many :abilities
	belongs_to :character

	def name
		unless try(:id).nil?
			"#{character.name}'s stats"
		end
	end

	def get_ability(name)
		abilities.where(ability_type: name.capitalize).first
	end

	def proficiency_bonus
		character.proficiency_bonus
	end

	def passive_perception
		(skill_check('perception') + 10).to_i
	end


	def skills
		skills = Array.new
		abilities.each do |ab|
			skills << ab.get_skills
		end
		return skills.flatten
	end

	def saving_throws
		st = Array.new
		abilities.each do |ab|
			st << ab.get_skill('saving throw')
		end

		return st
	end

	def initiative
		dex = get_ability('Dexterity').score
		get_score_bonus(dex)
	end

	def skill_check(name)
		skills.select{|f| f.name == name}.first.score
	end
end
