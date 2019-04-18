class Game < ApplicationRecord
	has_many :pieces
	belongs_to :white_player, :class_name => "User", :foreign_key => "white_id", required: false
	belongs_to :black_player, :class_name => "User", :foreign_key => "black_id", required: false

	after_create :populate_board!

	def populate_board!
		(0..7).each do |x_pos|
			Pawn.create(game: self, color: "white", x_position: x_pos, y_position: 1)
			Pawn.create(game: self, color: "black", x_position: x_pos, y_position: 6)
		end

		[0,7].each do |x_pos|
			Rook.create(game: self, color: "white", x_position: x_pos, y_position: 0)
			Rook.create(game: self, color: "black", x_position: x_pos, y_position: 7)
		end

		[1,6].each do |x_pos|
			Knight.create(game: self, color: "white", x_position: x_pos, y_position: 0)
			Knight.create(game: self, color: "black", x_position: x_pos, y_position: 7)
		end

		[2,5].each do |x_pos|
			Bishop.create(game: self, color: "white", x_position: x_pos, y_position: 0)
			Bishop.create(game: self, color: "black", x_position: x_pos, y_position: 7)
		end

		Queen.create(game: self, color: "white", x_position: 3, y_position: 0)
		Queen.create(game: self, color: "black", x_position: 3, y_position: 7)

		King.create(game: self, color:"white", x_position: 4, y_position: 0)
		King.create(game: self, color:"black", x_position: 4, y_position: 7)

  end
  
  def game_piece_at(row, column)
    pieces.find_by(y_position:row, x_position:column)
  end

  def game_in_check?
  	blackX = pieces.where(type:"King", color:"black").first.x_position
  	blackY = pieces.where(type:"King", color:"black").first.y_position
		whiteX = pieces.where(type:"King", color:"white").first.x_position
		whiteY = pieces.where(type:"King", color:"white").first.y_position
		pieces.all.each do |piece|
			if piece.color == "white" && piece.valid_move?(blackX, blackY)
				return true
			elsif piece.color == "black" && piece.valid_move?(whiteX, whiteY)
				return true
			end
		end
		return false
  end

end
