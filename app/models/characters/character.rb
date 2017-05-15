class Character < ApplicationRecord
	belongs_to :ability
	belongs_to :saving_throw
	belongs_to :skill
	belongs_to :race
	belongs_to :sense
	belongs_to :background
	has_and_belongs_to_many :languages
	has_and_belongs_to_many :features
	has_many :character_classes
	belongs_to :background
end