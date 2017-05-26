class Language < ApplicationRecord
	has_and_belongs_to_many :characters
	has_and_belongs_to_many :races

	validates_uniqueness_of :name
end