class Character < ApplicationRecord
	has_one :ability
	has_one :saving_throw
	has_one :skill
	has_one :race
	has_many :senses
	has_many :languages
	has_many :damage_inmunities
	has_many :damage_vulnerabilities
	has_many :damage_resistances
	has_many :condition_inmunities
end