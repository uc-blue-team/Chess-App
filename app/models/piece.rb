class Piece < ApplicationRecord
	belongs_to :game

	def lat_check(dest_x,dest_y)																						#Checks if a lateral move is obstructed
		game.pieces.each do |piece|																						#Loops across all pieces in the board to see if a piece is in between the start location and the destination
			if piece.y_position.to_i == y_position.to_i && (piece.x_position.between?(dest_x.to_i, x_position.to_i) or piece.x_position.between?(x_position.to_i, dest_x.to_i)) && piece.x_position.to_i != x_position.to_i
				return true
			end
		end
		return false																													#returns false if unobstructed
	end

	def long_check(dest_x,dest_y)
		game.pieces.each do |piece|																						#Checks if a vertical move is obstructed using the same technique as lateral moves
			if piece.x_position.to_i == x_position.to_i && (piece.y_position.between?(dest_y.to_i, y_position.to_i) or piece.y_position.between?(y_position.to_i, dest_y.to_i)) && piece.y_position.to_i != y_position.to_i
				return true
			end
		end
		return false
	end

	def diag_check(dest_x,dest_y)																						#check diagonal moves
		movement = (x_position.to_i - dest_x.to_i).abs																	#defines movement as magnitude of the move
		directionX = (dest_x.to_i - x_position.to_i)/(dest_x.to_i - x_position.to_i).abs					#provides positive values for rightward movement, negative for leftward movement
		directionY = (dest_y.to_i - y_position.to_i)/(dest_y.to_i - y_position.to_i).abs					#provides positive value for upward movement, negative for downward movement
		(1..movement).each do |i|																							#loops from 0 to magnitude, checking each piece if there is a piece inbetween the start and destination
			game.pieces.each do |piece|
				if x_position + i * (directionX) == piece.x_position && y_position + i * (directionY) == piece.y_position
					return true
				end
			end
		end
		return false
	end

	def off_the_board?(dest_x,dest_y)																				#check if move is off the board
		if dest_x.to_i > 7 || dest_y.to_i > 7 || dest_x.to_i < 0 || dest_y.to_i < 0 	
			return true
		end
	end

	def is_lateral?(dest_x,dest_y)
		if y_position.to_i == dest_y.to_i																								#check if the move is lateral
			return true
		end
	end

	def is_vertical?(dest_x,dest_y)																					#check if the move is vertical
		if x_position.to_i == dest_x.to_i
			return true
		end
	end

	def is_diagonal?(dest_x,dest_y)
	    if (x_position.to_i - dest_x.to_i).eql?(0)
	      return false
	    end
		if ((y_position.to_i - dest_y.to_i)/(x_position.to_i - dest_x.to_i)).abs.eql?(1)				#check if move is diagonal
			return true
		end
	end

	def is_obstructed?(dest_x,dest_y)
		if off_the_board?(dest_x,dest_y)							
			raise "invalid input: off the board"
		elsif is_lateral?(dest_x,dest_y)
			return lat_check(dest_x,dest_y)
		elsif is_vertical?(dest_x,dest_y)
			return long_check(dest_x,dest_y)
		elsif is_diagonal?(dest_x,dest_y)
		 	return diag_check(dest_x,dest_y)																		#check if the move is diagonal
		else																																	#returns error "invalid input" if the move is not diagonal, vertical, or lateral
			raise "invalid input: not valid input"
		end
	end

	def is_occupied_by_friend?(dest_x,dest_y)
		game.pieces.where(x_position: dest_x, y_position: dest_y, color: color).exists?
	end

	def is_occupied_by_enemy?(dest_x,dest_y)
		game.pieces.where(x_position: dest_x, y_position: dest_y).not(color: color).exists?
	end

	def move_to!(dest_x,dest_y)
		if !is_obstructed?(dest_x,dest_y) && !is_occupied_by_friend?(dest_x,dest_y)
			update_attributes(x_position: dest_x,y_position: dest_y)
		else
			raise ArgumentError, "Invalid x and y position"
		end
	end

end
