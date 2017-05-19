class CharacterStat < ApplicationRecord
	has_many :abilities
	belongs_to :character

	def name
		unless try(:id).nil?
			"#{character.name}'s stats"
		end
	end


	def skills
		skills = Array.new
		abilities.each do |ab|
			skills << ab.get_skills
		end
		return skills
	end

	def saving_throws
		st = Array.new
		abilities.each do |ab|
			st << ab.get_skill('saving throw')
		end

		return st
	end

	def initiative
		dex = abilities.where(ability_type: 'Dexterity').first.score
		if dex >= 0
			return "+#{dex.to_i}"
		else
			return "-#{dex.to_i}"
		end
	end

	def skill_check(name)
		skills.select{|f| f.name == name}
	end
end
