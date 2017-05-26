class CharactersController < ApplicationController
	layout "sheet"

	def show
		@character = Character.find(params[:id])
		@sheet = params[:sheet]
		@sheet ||= "melee"
	end

	def pdf
		character = Character.find(params[:id])
		character.generate_pdf
		redirect_to "/downloads/character_#{character.id}.pdf"
	end
end
