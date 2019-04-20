require 'rails_helper'

RSpec.describe PiecesController, type: :controller do
	context '#update' do
		it 'should assign @current_game' do
			game = Game.create
			piece = game.pieces.first

			put :update, params: {game_id: game.id,x_position: 1, y_position: 2, id: piece.id}

			expect(assigns(:current_game)).to eq game

		end


		it 'should assign @piece_selected' do
			game = Game.create
			piece = game.pieces.first

			put :update, params: {game_id: game.id,x_position: 0, y_position: 2, id: piece.id}

			expect(assigns(:piece_selected)).to eq piece

		end

		it 'Should accept correct piece parameters' do
			

		end

		it 'Should attempt to move the piece' do
			game = Game.create
			piece = game.pieces.first

			put :update, params: {game_id: game.id,x_position: 0, y_position: 2, id: piece.id}

			expect(assigns()).to eq piece.x_position
			expect(assigns()).to eq piece.y_position

		end

		it 'Should redirect to the correct game board' do

		end

	end
end
