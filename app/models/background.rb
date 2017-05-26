class Background < ApplicationRecord
	has_many :characters
	validates_uniqueness_of :name
end
