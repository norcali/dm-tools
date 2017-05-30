Sense.create({name:'No Darkvision'})
darkvision = Sense.create({name:'Darkvision 60ft'})
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
human = Race.create({
							name: "Human",
							size: "M",
							race_type: "Humanoid",
							sense_id: 1
						})
dwarf = Race.create({
							name: "Dwarf",
							size: "M",
							race_type: "Humanoid",
							sense_id: darkvision.id
						})
elf = Race.create({
							name: "Elf",
							size: "M",
							race_type: "Humanoid",
							sense_id: darkvision.id
						})

human.languages = Language.find_by_name('Common')
human.save

dwarf.languages << Language.find_by_name('Common')
dwarf.languages << Language.find_by_name('Dwarvish')
dwarf.save

elf.languages << Language.find_by_name('Common')
elf.languages << Language.find_by_name('Elvish')
elf.save

klass_1 = Klass.create({
							klass_type: "Cleric",
							specialization: "Arcana Domain",
							hit_die: 8,
							saving_throw_proficiency_1: "Wisdom",
							saving_throw_proficiency_2: "Charisma"
							})
klass_2 = Klass.create({
							klass_type: "Paladin",
							specialization: "",
							hit_die: 10,
							saving_throw_proficiency_1: "Wisdom",
							saving_throw_proficiency_2: "Charisma"
							})
background = Background.create({
										name: "Diplomat",
										skill_proficiency_1: "Persuasion",
										skill_proficiency_2: "History"
									})
char = Character.create({
									character_type: "PlayerCharacter",
									name: "Fredrik 'Moash' Kholin",
									alignment: "LN",
									speed: 30,
									armor_class: 21,
									base_armor_class: 19,
									hit_points: 63,
									race_id: dwarf.id,
									sense_id: darkvision.id,
									background_id: background.id
									})
stat = CharacterStat.create({character_id: char.id})

array = [['Strength', 15, 2], ['Dexterity', 12, 1], ['Constitution', 20, 5], ['Intelligence', 14, 2], ['Wisdom', 20, 5], ['Charisma', 17, 3]]
array.each do |n|
	Ability.create({ability_type: n[0], value: n[1], score: n[2], character_stat_id: stat.id})
end

CharacterClass.create({level: 3, klass_id: klass_1.id, character_id: char.id})
CharacterClass.create({level: 2, klass_id: klass_2.id, character_id: char.id})