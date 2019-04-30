require 'rails_helper'

RSpec.describe Game, type: :model do

	describe "game_in_check" do
		it "returns true if a game is in check" do
			game = Game.create
			game.pieces.destroy_all
			piece1 = Piece.create(x_position: 4 , y_position: 4, game: game, type: "King", color: "white")
			piece2 = Piece.create(x_position: 4 , y_position: 5, game: game, type: "Queen", color: "black")
			piece3 = Piece.create(x_position: 1 , y_position: 1, game: game, type: "King", color: "black")
			expect(piece2.valid_move?(4, 4)).to eq(true)
			expect(game.game_in_check?).to eq(true)
		end

		it "returns false if a game is not in check" do
			game = Game.create
			expect(game.game_in_check?).to eq(false)
		end

	end

	describe "checkmate" do
		it "returns true if a game is in checkmate" do
			game = Game.create
			game.pieces.destroy_all
			piece1 = Piece.create(x_position: 0 , y_position: 0, game: game, type: "King", color: "white")
			piece2 = Piece.create(x_position: 5 , y_position: 5, game: game, type: "Queen", color: "black")
			piece3 = Piece.create(x_position: 0 , y_position: 1, game: game, type: "Pawn", color: "White")
			piece4 = Piece.create(x_position: 1 , y_position: 0, game: game, type: "Pawn", color: "White")
			piece5 = Piece.create(x_position: 7 , y_position: 7, game: game, type: "King", color: "black")
			expect(game.game_in_check?).to eq(true)
			expect(game.checkmate?).to eq(true)
		end

		it "returns false if a game is not in checkmate" do
			game = Game.create
			expect(game.checkmate?).to eq(false)
		end

	end

end
