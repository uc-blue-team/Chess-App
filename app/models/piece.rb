class Piece < ApplicationRecord
	belongs_to :game

	def lat_check(dest_x,dest_y)																						#Checks if a lateral move is obstructed
		game.pieces.each do |piece|																						#Loops across all pieces in the board to see if a piece is in between the start location and the destination
			if piece.y_position == y_position && (piece.x_position.between?(dest_x, x_position) or piece.x_position.between?(x_position, dest_x)) && piece.x_position != x_position
				puts "move passed lateral check"
				return true
			end
		end
		puts "failed lat check"
		return false																													#returns false if unobstructed
	end

	def long_check(dest_x,dest_y)
		game.pieces.each do |piece|																						#Checks if a vertical move is obstructed using the same technique as lateral moves
			if piece.x_position == x_position && (piece.y_position.between?(dest_y, y_position) or piece.y_position.between?(y_position, dest_y)) && piece.y_position != y_position
				puts "verticle move is obstructed"
				return true
			end
		end
		puts "verticle move not obstructed"
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
		if ((y_position.to_i - dest_y.to_i)/(x_position.to_i - dest_x.to_i)).abs.eql?(1)					#check if move is diagonal
			return true
		end
	end

	def is_obstructed?(dest_x,dest_y)
		if off_the_board?(dest_x,dest_y)							
			raise "invalid input: Piece is off the board!"
		elsif is_lateral?(dest_x,dest_y)
			puts "move is lateral"
			return lat_check(dest_x,dest_y)
		elsif is_vertical?(dest_x,dest_y)
			puts "move is vertical"
			return long_check(dest_x,dest_y)
		elsif is_diagonal?(dest_x,dest_y)
			puts "move is diagonal"
			return diag_check(dest_x,dest_y)																		#check if the move is diagonal
		else																																	#returns error "invalid input" if the move is not diagonal, vertical, or lateral
			raise "invalid input"
		end
	end

	def is_occupied_by_friend?(dest_x,dest_y)
		puts "space is occupied by friend"
		game.pieces.where(x_position: dest_x.to_i, y_position: dest_y.to_i, color: color).exists?
	end

	def is_occupied_by_enemy?(dest_x,dest_y)
		puts "space is occupied by enemy"
		game.pieces.where(x_position: dest_x.to_i, y_position: dest_y.to_i).exists? && game.pieces.where(x_position: dest_x.to_i, y_position: dest_y.to_i).color != color
	end

	def move_to!(dest_x,dest_y)
		if valid_move?(dest_x, dest_y)
			puts "move is valid"
				if is_occupied_by_enemy?(dest_x,dest_y)
					puts "space is occupied by enemy"
					defending_piece = game.pieces.where(x_position: dest_x, y_position: dest_y).first
					# Check if the new_position is occupied
					if defending_piece.y_position.to_i == dest_y.to_i && defending_piece.x_position.to_i == dest_x.to_i
						# Capture the piece
						if color != defending_piece.color
							defending_piece.destroy
						else
							raise "Can't capture your own mate"
						end
					end
				else
				end
			update_attributes(x_position: dest_x,y_position: dest_y)
		else
			raise "invalid input when trying to move piece"
		end
	end

end
