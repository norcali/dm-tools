class Race < ApplicationRecord
	belongs_to :character
	has_many :condition_resistances
	has_many :damage_resistances
	has_many :condition_inmunities
	has_many :languages
end
