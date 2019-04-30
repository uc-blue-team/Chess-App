require 'rails_helper'

RSpec.describe PiecesController, type: :controller do
	context '#update' do
		let(:game) {Game.create}
		let(:piece) {game.pieces.first}
		let(:new_x) {0}
		let(:new_y) {2}

		it 'assigns @current_game' do
			put :update, params: {game_id: game.id,x_position: 1, y_position: 2, id: piece.id}
			expect(assigns(:current_game)).to eq game
		end

		it 'accepts correct piece parameters' do	

		end

		it 'moves the piece' do
			put :update, params: {game_id: game.id,x_position: new_x, y_position: new_y, id: piece.id}

			piece.reload

			expect(piece.x_position).to eq new_x
			expect(piece.y_position).to eq new_y
		end

		it 'redirects to the correct game board' do
			put :update, params: {game_id: game.id,x_position: new_x, y_position: new_y, id: piece.id}
			expect(response).to redirect_to(game_path(game))
		end

		context 'invalid' do
			it 'returns 500 when x and y position are invalid' do
				expect {  
					put :update, params: {game_id: game.id,x_position: 'x_position',y_position: 'y_position', id: piece.id}
				}.to raise_error(ArgumentError)
			end
		end
	end
end
