class CharactersController < ApplicationController
	layout "sheet"

	def show
		@character = Character.find(params[:id])
		@sheet = params[:sheet]
		@sheet ||= "melee"
	end
end
