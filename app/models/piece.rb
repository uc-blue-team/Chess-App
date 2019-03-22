class Piece < ApplicationRecord
	belongs_to :game

	def lat_check(dest_x,dest_y)
		game.pieces.each do |piece|
			if piece.y_position == y_position && (piece.x_position.between?(dest_x, x_position) or piece.x_position.between?(x_position, dest_x)) && piece.x_position != x_position
				return true
			end
		end
		return false
	end

	def long_check(dest_x,dest_y)
		game.pieces.each do |piece|
			if piece.x_position == x_position && (piece.y_position.between?(dest_y, y_position) or piece.y_position.between?(y_position, dest_y)) && piece.y_position != y_position
				return true
			end
		end
		return false
	end

	def diag_check(dest_x,dest_y)
		movement = (x_position - dest_x).abs
		directionX = (dest_x - x_position)/(dest_x - x_position).abs
		directionY = (dest_y - y_position)/(dest_y - y_position).abs
		(1..movement).each do |i|
			game.pieces.each do |piece|
				if x_position + i * (directionX) == piece.x_position && y_position + i * (directionY) == piece.y_position
					return true
				end
			end
		end
		return false
	end

	def is_obstructed?(dest_x,dest_y)
		if dest_x > 7 || dest_y > 7 || dest_x < 0 || dest_y < 0 
			raise "invalid input"
		elsif y_position == dest_y
			return lat_check(dest_x,dest_y)
		elsif x_position == dest_x
			return long_check(dest_x,dest_y)
		elsif ((y_position - dest_y)/(x_position - dest_x)).abs.eql?(1)
			return diag_check(dest_x,dest_y)
		else
			raise "invalid input"
		end
	end


end
