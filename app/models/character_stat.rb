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

	def languages
		character.languages.map(&:name)
	end

	def tools
		[]
	end

	def class_features
		""
	end

	def features
		""
	end

	def spell_dc
		dc = []
		character.character_classes.each do |cl|
			if cl.klass.magic_type.include?("caster") || cl.klass.magic_type.include?("special")
				dc << (8 + proficiency_bonus.to_i + get_ability(cl.klass.spell_ability).score).to_i
			end
		end

		dc
	end

	def spell_attack_bonus
		sp_attack = []
		character.character_classes.each do |cl|
			if cl.klass.magic_type.include?("caster") || cl.klass.magic_type.include?("special")
				bonus = proficiency_bonus.to_i + get_ability(cl.klass.spell_ability).score
				sp_attack << get_score_bonus(bonus)
			end
		end

		sp_attack
	end

	def print_languages
		languages.reject(&:blank?).join(', ')
	end

	def print_tools
		tools.reject(&:blank?).join(', ')
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
		abilities.each{|ab| st << ab.saving_throw }
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
