class PiecesController < ApplicationController


	def update

		game = Game.find(params[:game_id])
		piece = game.pieces.where(id: params[:id]).first
		new_x_position = params[:move_x]
		new_y_position = params[:move_y]

		piece.move_to(new_x_position, new_y_position)

		redirect_to game_path(game)




	end



	private

	def piece_params
		@piece_params = params.require(:piece).permit(

			:x_position,
			:y_position,
			:type

		)



end
