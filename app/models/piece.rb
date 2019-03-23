class Piece < ApplicationRecord
	belongs_to :game

	# This function assumes the move is valid
	def move_to(new_x, new_y)

		game.pieces.each do |piece|
			# Check if the new_position is occupied
			if piece.y_position == new_y and piece.x_position == new_x begin
				# Capture the piece  
				if piece.color != color begin
					piece.destroy
					break
				end else begin
					raise "Can't capture your own mate"
					return	
				end
			end
		end
		x_position = new_x;
		y_position = new_y;
	end

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

	def off_the_board?(dest_x,dest_y)																				#check if move is off the board
		if dest_x > 7 || dest_y > 7 || dest_x < 0 || dest_y < 0 	
			return true
		end
	end

	def is_lateral?(dest_x,dest_y)
		if y_position == dest_y																								#check if the move is lateral
			return true
		end
	end

	def is_vertical?(dest_x,dest_y)																					#check if the move is vertical
		if x_position == dest_x
			return true
		end
	end

	def is_diagonal?(dest_x,dest_y)
		if ((y_position - dest_y)/(x_position - dest_x)).abs.eql?(1)					#check if move is diagonal
			return true
		end
	end

	def is_obstructed?(dest_x,dest_y)
		if off_the_board?(dest_x,dest_y)							
			raise "invalid input"
		elsif is_lateral?(dest_x,dest_y)
			return lat_check(dest_x,dest_y)
		elsif is_vertical?(dest_x,dest_y)
			return long_check(dest_x,dest_y)
		elsif is_diagonal?(dest_x,dest_y)
			return diag_check(dest_x,dest_y)																		#check if the move is diagonal
		else																																	#returns error "invalid input" if the move is not diagonal, vertical, or lateral
			raise "invalid input"
		end
	end


end
