class CharactersController < ApplicationController
	before_action :set_character, only: [:show, :edit, :update, :destroy, :pdf, :sheet]

	def show
	end

	def pdf
		@character.generate_pdf
		redirect_to "/downloads/character_#{character.id}.pdf"
	end

	def sheet
		@character = Character.find(params[:id])
		@sheet = params[:sheet]
		@sheet ||= "melee"
		render 'sheet', layout: "sheet"
	end

	def new
		@character = Character.new
		render 'form'
	end

	def create
		sense = {sense_id: Race.find(character_params[:race_id]).sense_id}
		@character = Character.new(character_params.merge(sense))
		if @character.save
			@stat = CharacterStat.create(character_id: @character.id)
			redirect_to edit_character_stat_path(@stat)
		end
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