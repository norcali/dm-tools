class ApplicationRecord < ActiveRecord::Base
	include StatCalculator
  self.abstract_class = true
end
