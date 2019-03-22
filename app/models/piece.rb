class Piece < ApplicationRecord
	belongs_to :game

	def lat_check(dest_x,dest_y)
		start_x = x_position
		start_y = y_position
		game.pieces.each do |piece|
			if piece.y_position == start_y && piece.x_position.between?(start_x, dest_x) && piece.x_position != start_x
				return true
			end
		end
		return false
	end

	def long_check(dest_x,dest_y)
		start_x = x_position
		start_y = y_position
		game.pieces.each do |piece|
			if piece.x_position == start_x && piece.y_position.between?(start_y, dest_y) && piece.y_position != start_y
				return true
			end
		end
		return false
	end

	def diag_check(dest_x,dest_y)
		start_x = x_position
		start_y = y_position
		movement = (start_x - dest_x).abs
		directionX = (dest_x - start_x)/(dest_x - start_x).abs
		directionY = (dest_y - start_y)/(dest_y - start_y).abs
		(1..movement).each do |i|
			game.pieces.each do |piece|
				if start_x + i * (directionX) == piece.x_position && start_y + i * (directionY) == piece.y_position
					return true
				end
			end
		end
		return false
	end

	def is_obstructed?(dest_x,dest_y)
		start_x = x_position
		start_y = y_position
		if dest_x > 7 || dest_y > 7
			raise "invalid input"
		elsif start_y == dest_y
			return lat_check(dest_x,dest_y)
		elsif start_x == dest_x
			return long_check(dest_x,dest_y)
		elsif ((start_y - dest_y)/(start_x - dest_x)).abs.eql?(1)
			return diag_check(dest_x,dest_y)
		else
			raise "invalid input"
		end
	end


end
