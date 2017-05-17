class Sense < ApplicationRecord
	has_many :characters
	has_many :races
end