class CharactersController < ApplicationController
	layout "sheet"

	def show
		@character = Character.find(1)
		@sheet = params[:sheet]
		@sheet ||= "melee"
	end
end
