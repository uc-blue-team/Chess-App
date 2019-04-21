require 'rails_helper'

RSpec.describe Piece, type: :model do
	describe "is_obstructed" do 
		it "checks horizontal obstruction and returns true when obstructed (moving right)" do
			game = Game.create
			piece1 = Piece.create(x_position: 1 , y_position: 1, game: game)
			piece2 = Piece.create(x_position: 3 , y_position: 1, game: game)
			expect(piece1.is_obstructed?(5,1)).to eq(true)
		end

		it "checks horizontal obstruction and returns true when obstructed (moving left)" do
			game = Game.create
			piece1 = Piece.create(x_position: 5 , y_position: 1, game: game)
			piece2 = Piece.create(x_position: 2 , y_position: 1, game: game)
			expect(piece1.is_obstructed?(1,1)).to eq(true)
		end

		it "checks horizontal obstruction and returns false when not obstructed" do
			game = Game.create
			piece1 = Piece.create(x_position: 2 , y_position: 2, game: game)
			expect(piece1.is_obstructed?(5,2)).to eq(false)
		end

		it "checks vertical obstruction and returns true when obstructed (moving forward)" do
			game = Game.create
			piece1 = Piece.create(x_position: 1 , y_position: 1, game: game)
			piece2 = Piece.create(x_position: 1 , y_position: 3, game: game)
			expect(piece1.is_obstructed?(1,5)).to eq(true)
		end

		it "checks vertical obstruction and returns true when obstructed (moving backwards)" do
			game = Game.create
			piece1 = Piece.create(x_position: 1 , y_position: 5, game: game)
			piece2 = Piece.create(x_position: 1 , y_position: 2, game: game)
			expect(piece1.is_obstructed?(1,1)).to eq(true)
		end

		it "checks vertical obstruction and returns false when not obstructed" do
			game = Game.create
			piece1 = Piece.create(x_position: 1 , y_position: 1, game: game)
			expect(piece1.is_obstructed?(1,3)).to eq(false)
		end

		it "checks diagonal obstruction and returns true when obstructed (moving up and right)" do
			game = Game.create
			piece1 = Piece.create(x_position: 1 , y_position: 1, game: game)
			piece2 = Piece.create(x_position: 3 , y_position: 3, game: game)
			expect(piece1.is_obstructed?(5,5)).to eq(true)
		end

		it "checks diagonal obstruction and returns true when obstructed (moving down and right)" do
			game = Game.create
			piece1 = Piece.create(x_position: 3 , y_position: 3, game: game)
			piece2 = Piece.create(x_position: 2 , y_position: 4, game: game)
			expect(piece1.is_obstructed?(1,5)).to eq(true)
		end


		it "checks diagonal obstruction and returns true when obstructed (moving down and left)" do
			game = Game.create
			piece1 = Piece.create(x_position: 3 , y_position: 3, game: game)
			piece2 = Piece.create(x_position: 2 , y_position: 2, game: game)
			expect(piece1.is_obstructed?(1,1)).to eq(true)
		end

		it "checks diagonal obstruction and returns true when obstructed (moving up and left)" do
			game = Game.create
			piece1 = Piece.create(x_position: 3 , y_position: 3, game: game)
			piece2 = Piece.create(x_position: 4 , y_position: 2, game: game)
			expect(piece1.is_obstructed?(5,1)).to eq(true)
		end

		it "checks diagonal obstruction and returns false when not obstructed" do
			game = Game.create
			piece1 = Piece.create(x_position: 1 , y_position: 1, game: game)
			expect(piece1.is_obstructed?(5,5)).to eq(false)
		end
	end

end
