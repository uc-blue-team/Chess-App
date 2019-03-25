class Game < ApplicationRecord
	has_many :pieces



	after_create :populate_board!

	def populate_board!
		(0..7).each do |x_pos|
			Pawn.create(game: self, color: white, x_position: x_pos, y_position: 1)
			Pawn.create(game: self, color: black, x_position: x_pos, y_position: 6)
		end

		[0,7].each do |x_pos|
			Rook.create(game: self, color: white, x_position: x_pos, y_position: 0)
			Rook.create(game: self, color: black, x_position: x_pos, y_position: 7)
		end

		[1,6].each do |x_pos|
			Knight.create(game: self, color: white, x_position: x_pos, y_position: 0)
			Knight.create(game: self, color: black, x_position: x_pos, y_position: 7)
		end

		[2,5].each do |x_pos|
			Bishop.create(game: self, color: white, x_position: x_pos, y_position: 0)
			Bishop.create(game: self, color: black, x_position: x_pos, y_position: 7)
		end

		Queen.create(game: self, color: white, x_position: 3, y_position: 0)
		Queen.create(game: self, color: black, x_position: 3, y_position: 7)

		King.create(game: self, color: white, x_position: 4, y_position: 0)
		King.create(game: self, color: black, x_position: 4, y_position: 7)

	end

end
