class CharacterStatsController < ApplicationController
	before_action :set_character_stat, only: [:edit, :update, :destroy]

	def edit
		render 'form'
	end

	def update
		value = character_stat_params[:strength].to_i
		Ability.create(character_stat_id: @character_stat.id, ability_type: 'Strength', value: value, score: $ability_scores[value].to_i)
		value = character_stat_params[:dexterity].to_i
		Ability.create(character_stat_id: @character_stat.id, ability_type: 'Dexterity', value: value, score: $ability_scores[value].to_i)
		value = character_stat_params[:constitution].to_i
		Ability.create(character_stat_id: @character_stat.id, ability_type: 'Constitution', value: value, score: $ability_scores[value].to_i)
		value = character_stat_params[:intelligence].to_i
		Ability.create(character_stat_id: @character_stat.id, ability_type: 'Intelligence', value: value, score: $ability_scores[value].to_i)
		value = character_stat_params[:wisdom].to_i
		Ability.create(character_stat_id: @character_stat.id, ability_type: 'Wisdom', value: value, score: $ability_scores[value].to_i)
		value = character_stat_params[:charisma].to_i
		Ability.create(character_stat_id: @character_stat.id, ability_type: 'Charisma', value: value, score: $ability_scores[value].to_i)

		redirect_to root_path
	end

	private

	def set_character_stat
		@character_stat = CharacterStat.find(params[:id])
	end

	def character_stat_params
		params.require(:character_stat).permit(	:character_id,
																						:strength,
																						:dexterity,
																						:constitution,
																						:intelligence,
																						:wisdom,
																						:charisma
																						)
	end
end