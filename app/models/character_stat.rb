class CharacterStat < ApplicationRecord
	attr_accessor :strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma
	has_many :abilities, dependent: :destroy
	belongs_to :character
	validate :ability_total

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
		[]
	end

	def features
		[]
	end

	def spell_dc
		dc = []
		unless character.no_magic?
			character.character_classes.each do |cl|
				dc << (8 + proficiency_bonus.to_i + get_ability(cl.klass.spell_ability).score).to_i
			end
		end

		dc
	end

	def spell_attack_bonus
		sp_attack = []
		unless character.no_magic?
			character.character_classes.each do |cl|
				bonus = proficiency_bonus.to_i + get_ability(cl.klass.spell_ability).score
				sp_attack << get_score_bonus(bonus)
			end
		end

		sp_attack
	end

	def prepared_spells
		unless character.no_magic?
			spells = 0
			character.character_classes.each do |cl|
				spells += cl.klass.prepared_spells(get_ability((cl.klass.spell_ability)).score, cl.level)
			end

			spells
		end
	end

	def total_spell_level
		character.character_classes.map{|cl| cl.total_spell_level}.sum
	end

	def spell_slots
		spell_slots_by_level(total_spell_level)
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
		skills.select{|f| f.name.downcase == name.downcase}.first.score
	end

	private

	def ability_total
    return if abilities.blank?
    errors.add("Too many abilities") if abilities.count > 6
  end

  def set_skill_proficiencies
  	set_class_proficiencies && set_background_proficiencies
  end

  def set_class_proficiencies
  	ability = abilities.where(ability_type: character.character_classes.first.klass.saving_throw_proficiency_1).first
  	ability.saving_throw.update(proficiency: true)
  	ability = abilities.where(ability_type: character.character_classes.first.klass.saving_throw_proficiency_2).first
  	ability.saving_throw.update(proficiency: true)
  end

  def set_background_proficiencies
  	skill = skills.select{|f| f.name.downcase == character.background.skill_proficiency_1.downcase}.first
  	skill.update(proficiency: true)
  	skill = skills.select{|f| f.name.downcase == character.background.skill_proficiency_2.downcase}.first
  	skill.update(proficiency: true)
  end
end
