require 'rails_helper'

RSpec.describe Piece, type: :model do
	describe "is_obstructed" do 
		it "checks horizontal obstruction and returns true when obstructed" do
			game = Game.create
			piece1 = Piece.create(x_position: 1 , y_position: 1, game: game)
			piece2 = Piece.create(x_position: 3 , y_position: 1, game: game)
			expect(piece1.is_obstructed?(5,1)).to eq(true)
		end

		it "checks horizontal obstruction and returns false when not obstructed" do
			game = Game.create
			piece1 = Piece.create(x_position: 1 , y_position: 1, game: game)
			expect(piece1.is_obstructed?(5,1)).to eq(false)
		end

		it "checks vertical obstruction and returns true when obstructed" do
			game = Game.create
			piece1 = Piece.create(x_position: 1 , y_position: 1, game: game)
			piece2 = Piece.create(x_position: 1 , y_position: 3, game: game)
			expect(piece1.is_obstructed?(1,5)).to eq(true)
		end

		it "checks vertical obstruction and returns false when not obstructed" do
			game = Game.create
			piece1 = Piece.create(x_position: 1 , y_position: 1, game: game)
			expect(piece1.is_obstructed?(1,5)).to eq(false)
		end

		it "checks diagonal obstruction and returns true when obstructed" do
			game = Game.create
			piece1 = Piece.create(x_position: 1 , y_position: 1, game: game)
			piece2 = Piece.create(x_position: 3 , y_position: 3, game: game)
			expect(piece1.is_obstructed?(5,5)).to eq(true)
		end

		it "checks diagonal obstruction and returns false when not obstructed" do
			game = Game.create
			piece1 = Piece.create(x_position: 1 , y_position: 1, game: game)
			expect(piece1.is_obstructed?(5,5)).to eq(false)
		end

		it "checks for valid inputs and raises error when invalid" do
			game = Game.create
			piece1 = Piece.create(x_position: 1 , y_position: 1, game: game)
			piece2 = Piece.create(x_position: 1 , y_position: 3, game: game)
			expect { piece1.is_obstructed?(3,5) }.to raise_error("invalid input")
		end
		it "checks for inputs on the board and raises error when move is off the board" do
			game = Game.create
			piece1 = Piece.create(x_position: 1 , y_position: 1, game: game)
			piece2 = Piece.create(x_position: 1 , y_position: 3, game: game)
			expect { piece1.is_obstructed?(1,8) }.to raise_error("invalid input")
		end
	end

end
