class CharacterStatsController < ApplicationController

	def create

	end


	private

	def character_stat_params
		params.require(:character).permit(:character_id
																			:strength,
																			:dexterity,
																			:constitution,
																			:intelligence,
																			:wisdom,
																			:charisma
																			)
	end
end