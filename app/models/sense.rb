class Sense < ApplicationRecord
	has_many :characters
	has_many :races

	validates_uniqueness_of :name
end