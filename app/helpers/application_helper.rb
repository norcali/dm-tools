module ApplicationHelper
	def populate_navbar
		not_models = ['ar_internal_metadata', 'schema_migrations', 'actions', 'roles', 'users', 'actions_roles']
		rest = ActiveRecord::Base.connection.data_sources.select{|f| !not_models.include?(f)}
		[rest]
	end
	def modifier(ability_score)
		$ability_scores[ability_score]
	end
end
