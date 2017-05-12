class DamageResistance < ApplicationRecord
	belongs_to :character
	belongs_to :race
end