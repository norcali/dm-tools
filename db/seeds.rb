# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Sense.create({name:'No Darkvision'})
Sense.create({name:'Darkvision 60ft'})
Sense.create({name:'Darkvision 120ft'})
Language.create({name:'Common'})
Language.create({name:'Dwarvish'})
Language.create({name:'Elvish'})
Language.create({name:'Draconic'})
Language.create({name:'Gnomish'})
Language.create({name:'Orcish'})
Language.create({name:'Giant'})
Language.create({name:'Celestial'})
Language.create({name:'Abyssal'})
Language.create({name:'Infernal'})
Language.create({name:'Primordial'})
Language.create({name:'Undercommon'})
Race.create({
							name: "Human",
							size: "M",
							race_type: "Humanoid",
							sense_id: 1
						})
Race.create({
							name: "Dwarf",
							size: "M",
							race_type: "Humanoid",
							sense_id: 2
						})
Race.create({
							name: "Elf",
							size: "M",
							race_type: "Humanoid",
							sense_id: 2
						})
Klass.create({
							klass_type: "Cleric",
							specialization: "Arcana Domain",
							hit_die: 8,
							saving_throw_proficiency_1: "Wisdom",
							saving_throw_proficiency_2: "Charisma"
							})
Klass.create({
							klass_type: "Paladin",
							specialization: "",
							hit_die: 10,
							saving_throw_proficiency_1: "Wisdom",
							saving_throw_proficiency_2: "Charisma"
							})
Background.create({
										name: "Diplomat",
										skill_proficiency_1: "Persuasion",
										skill_proficiency_2: "History"
									})
Character.create({
									character_type: "PlayerCharacter",
									name: "Fredrik 'Moash' Kholin",
									alignment: "LN",
									speed: 30,
									armor_class: 21,
									base_armor_class: 19,
									hit_points: 63,
									race_id: 2,
									sense_id: 2,
									background_id: 1
									})
CharacterStat.create({character_id: 1})

array = [['Strength', 15, 2], ['Dexterity', 12, 1], ['Constitution', 20, 5], ['Intelligence', 14, 2], ['Wisdom', 20, 5], ['Charisma', 17, 3]]
array.each do |n|
	Ability.create({ability_type: n[0], value: n[1], score: n[2], character_stat_id: 1})
end

CharacterClass.create({level: 3, klass_id: 1, character_id: 1})
CharacterClass.create({level: 2, klass_id: 2, character_id: 1})

array = [["saving throw", "athletics"], ["saving throw", "acrobatics", "sleight of hand", "stealth"], ["saving throw"], ["saving throw", "arcana", "history", "investigation", "nature", "religion"], ["saving throw", "animal handling", "insight", "medicine", "perception", "survival"], ["saving throw", "deception", "intimidation", "performance", "persuasion"]]

array.each_with_index do |arr, i|
	arr.each do |a|
		AbilityItem.create({name: a, ability_id: i})
	end
end