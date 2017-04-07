class Monster < ApplicationRecord
	has_one :ability
	has_one :saving_throw
	has_one :skill
	has_many :senses
	has_many :special_abilities
	has_many :actions
	has_many :languages
	has_many :damage_inmunities
	has_many :damage_vulnerabilities
	has_many :damage_resistances
	has_many :condition_inmunities
	has_many :environments
end