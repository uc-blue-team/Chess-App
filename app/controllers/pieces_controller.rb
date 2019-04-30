class PiecesController < ApplicationController


	def update
		piece_selected = current_game.pieces.where(id: params[:id]).first
		new_x_position = params[:x_position]
		new_y_position = params[:y_position]

		
		piece_selected.move_to!(new_x_position, new_y_position)

		redirect_to game_path(current_game)

	end



	private

	def piece_params
		@piece_params = params.require(:piece).permit(

			:x_position,
			:y_position,
			:type

		)

	end

	def current_game
		@current_game ||= Game.find(params[:game_id])
	end



end
