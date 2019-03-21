class Piece < ApplicationRecord
	belongs_to :game

	def lat_check(dest_x,dest_y) 				#checks if a lateral move is obstructed, returns true if it is
		start_x = x_position
		start_y = y_position
		game.pieces.each do |piece|
			if piece.y_position == start_y && piece.x_position.between?(start_x, dest_x) && piece.x_position != start_x
				return true
			end
		end
		return false					#returns false is unobstructed
	end

	def long_check(dest_x,dest_y)				#checks if a lateral move is obstructed, returns true if it is
		start_x = x_position
		start_y = y_position
		game.pieces.each do |piece|
			if piece.x_position == start_x && piece.y_position.between?(start_y, dest_y) && piece.y_position != start_y
				return true
			end
		end
		return false					#returns false if unobstructed
	end

	def diag_check(dest_x,dest_y)				#checks if a diagonal move is obstructed, returns true if it is
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
		return false					#returns false if unobstructed
	end

	def is_obstructed?(dest_x,dest_y)
		start_x = x_position
		start_y = y_position
		if dest_x > 7 || dest_y > 7			#checks if a move is on the board
			raise "invalid input"
		elsif start_y == dest_y	&& start_x != dest_x			#checks if the move is lateral
			return lat_check(dest_x,dest_y)
		elsif start_x == dest_x	&& start_y != dest_y			#checks if the move is vertical
			return long_check(dest_x,dest_y)
		elsif ((start_y - dest_y)/(start_x - dest_x)).abs.eql?(1)	#checks if the move is diagonal
			return diag_check(dest_x,dest_y)
		else						#if all checks fail move is invalis
			raise "invalid input"
		end
	end

end
