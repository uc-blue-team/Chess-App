class Piece < ApplicationRecord
	belongs_to :game

	def lat_check(dest_x,dest_y)																						#Checks if a lateral move is obstructed
		game.pieces.each do |piece|																						#Loops across all pieces in the board to see if a piece is in between the start location and the destination
			if piece.y_position == y_position && (piece.x_position.between?(dest_x, x_position) or piece.x_position.between?(x_position, dest_x)) && piece.x_position != x_position
				return true
			end
		end
		return false																													#returns false if unobstructed
	end

	def long_check(dest_x,dest_y)
		game.pieces.each do |piece|																						#Checks if a vertical move is obstructed using the same technique as lateral moves
			if piece.x_position == x_position && (piece.y_position.between?(dest_y, y_position) or piece.y_position.between?(y_position, dest_y)) && piece.y_position != y_position
				return true
			end
		end
		return false
	end

	def diag_check(dest_x,dest_y)																						#check diagonal moves
		movement = (x_position - dest_x).abs																	#defines movement as magnitude of the move
		directionX = (dest_x - x_position)/(dest_x - x_position).abs					#provides positive values for rightward movement, negative for leftward movement
		directionY = (dest_y - y_position)/(dest_y - y_position).abs					#provides positive value for upward movement, negative for downward movement
		(1..movement).each do |i|																							#loops from 0 to magnitude, checking each piece if there is a piece inbetween the start and destination
			game.pieces.each do |piece|
				if x_position + i * (directionX) == piece.x_position && y_position + i * (directionY) == piece.y_position
					return true
				end
			end
		end
		return false
	end

	def is_obstructed?(dest_x,dest_y)
		if dest_x > 7 || dest_y > 7 || dest_x < 0 || dest_y < 0 							#check if move is on the board
			raise "invalid input"
		elsif y_position == dest_y																						#check if the move is lateral
			return lat_check(dest_x,dest_y)
		elsif x_position == dest_x																						#check if the move is vertical
			return long_check(dest_x,dest_y)
		elsif ((y_position - dest_y)/(x_position - dest_x)).abs.eql?(1)
			return diag_check(dest_x,dest_y)																		#check if the move is diagonal
		else																																	#returns error "invalid input" if the move is not diagonal, vertical, or lateral
			raise "invalid input"
		end
	end


end
