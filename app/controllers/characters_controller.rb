class CharactersController < ApplicationController
	before_action :set_character, only: [:show, :edit, :update, :destroy]
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

	def new
		@character = Character.new
		render_form(@character, params)
	end


	private

	def set_character
		@character = Character.find(params[:id])
	end

	def character_params
		params.require(:character).permit(:name,
																			:character_type,
																			:alignment,
																			:armor_class,
																			:base_armor_class,
																			:hit_points,
																			:race_id,
																			:sense_id,
																			:background_id
																			)
	end
end