class Race < ApplicationRecord
	has_many :characters
	belongs_to :sense
	has_and_belongs_to_many :languages
	validates_uniqueness_of :name
end
